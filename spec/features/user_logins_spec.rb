require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js:true do
  before :each do
    @user = User.create! first_name: 'Bob', last_name: 'Smith', email: "Bob@gmail.com", password: "123456", password_confirmation: "123456"
  end

  scenario "It should login a user" do
    # Action
    visit '/login'

    fill_in "email", with: "Bob@gmail.com"
    fill_in "password", with: "123456"
    find("input[name='commit']").click
    
    expect(page).to have_content "Bob@gmail.com"
  end
end
