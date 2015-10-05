require 'rails_helper'

feature 'user goes to home page', %Q{
  As a user
  I want to go to my home page
  So that I can see my lastest updates and profile

  Acceptance Criteria
  []Users should see home icon and sub-nav bar
  []User should see their profile block which includes
    name, title, email, address, city, state, zip, phone
  []User should see settings button to change their profile
} do
  feature "user is signed in" do
    before(:each) do
       @user = FactoryGirl.create(:user)
       visit new_user_session_path
       fill_in 'Email', with: @user.email
       fill_in 'Password', with: @user.password
       click_button 'Log in'
     end

    scenario 'Users should see home icon and sub-nav bar' do
      visit user_path(@user.id)

      expect(page).to have_content('Home')
      expect(page).to have_content('Groups')
      expect(page).to have_content('Tasks')
      expect(page).to have_content('Users')
      expect(page).to have_content('Roledex')
      expect(page).to have_content('Files')
      expect(page).to have_content('Sign Out')
    end

    scenario 'User should see their profile block' do
      user = FactoryGirl.create(:user)

      visit user_path(@user.id)

      expect(page).to have_content(@user.first_name)
      expect(page).to have_content(@user.last_name)
      expect(page).to have_content(@user.title)
      expect(page).to have_content(@user.address)
      expect(page).to have_content(@user.city)
      expect(page).to have_content(@user.state)
      expect(page).to have_content(@user.zip)
      expect(page).to have_content(@user.phone)
      expect(page).to have_content(@user.last_sign_in_at)  
    end
  end
end
