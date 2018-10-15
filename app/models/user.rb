class User < ActiveRecord::Base
  has_secure_password

  has_many :review

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password_digest, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validate :password_length

  def self.authenticate_with_credentials (email, password)
    @email = email.split(" ")[0].downcase
    @user = self.find_by("LOWER(email) = ?", @email)
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end

  private
  def password_length
    if (password.length < 6)
      errors.add(:password, "must be 6 digits or more")
    end
  end
end
