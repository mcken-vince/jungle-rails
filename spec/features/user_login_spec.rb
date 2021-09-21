require 'rails_helper'

RSpec.feature "Existing user logs in", type: :feature do
  before :each do
    @user = User.create! first_name: 'Joe', last_name: 'Blow', email: 'joe@blow.co', password: 'inconceivable', password_confirmation: 'inconceivable'
  end

  scenario "Login is successful" do
    visit '/login'
    

    fill_in 'email', with: 'joe@blow.co'
    fill_in 'password', with: 'inconceivable'
    click_button 'Submit'

    puts page.html

    expect(page).to have_content 'Signed in as Joe'
  end
end
