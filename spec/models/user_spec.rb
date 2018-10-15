require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validate" do

    it "should not be valid if password does not match" do
      user = {first_name: "Bob", last_name: "Smith", email: "bob@bob.com", password:"123456", password_confirmation: "321321"}
      @user = User.new(user)
      @user.save
      expect(@user).not_to be_valid
    end

    it "should not be valid if duplicate email signup" do
      user2 = {first_name: "Bob", last_name: "Smith", email: "Bob@bob.COM", password:"123456", password_confirmation: "123456"}
      user1 = {first_name: "Bob", last_name: "Smith", email: "bob@bob.com", password:"123456", password_confirmation: "123456"}
      @user1 = User.new(user1)
      @user1.save
      @user2 = User.new(user2)
      @user2.save
      expect(@user1).to be_valid
      expect(@user2).not_to be_valid
    end

    it "should not be valid if email is not present" do
      user = {first_name: "Bob", last_name: "Smith", password:"123456", password_confirmation: "123456"}
      @user = User.new(user)
      @user.save
      expect(@user).not_to be_valid
    end

    it "should not be valid if first_name is not present" do
      user = {last_name: "Smith", email: "bob@bob.com", password:"123456", password_confirmation: "123456"}
      @user = User.new(user)
      @user.save
      expect(@user).not_to be_valid
    end

    it "should not be valid if last_name is not present" do
      user = {first_name: "Bob", email: "bob@gmail.com", password:"123456", password_confirmation: "123456"}
      @user = User.new(user)
      @user.save
      expect(@user).not_to be_valid
    end

    it "should not be valid if password length is less than 6 digits" do
      user = {first_name: "Judy", last_name: "Smith", email: "judy@gmail.com", password:"1234", password_confirmation: "1234"}
      @user = User.new(user)
      @user.save
      expect(@user).not_to be_valid
    end
  end

  describe ".authenticate_with_credentials" do
    it "should pass the test if space exist before or after email present" do 
      @new_user = {first_name: "Alice", last_name: "Hunter", email: "alice@gmail.com", password: "123456", password_confirmation: "123456"}
      @user = User.new(@new_user)
      @user.save

      @login_user = User.authenticate_with_credentials(" alice@gmail.com ", "123456")
      expect(@user).to eql(@login_user)
    end
    it "should pass the test if email case is wrong" do
      @new_user = {first_name: "Alice", last_name: "Hunter", email: "alice@gmail.com", password: "123456", password_confirmation: "123456"}
      @user = User.new(@new_user)
      @user.save

      @login_user = User.authenticate_with_credentials("alIce@GMail.COm", "123456")
      expect(@user).to eql(@login_user)
    end
  end
end
