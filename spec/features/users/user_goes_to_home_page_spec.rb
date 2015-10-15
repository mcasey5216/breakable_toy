require 'rails_helper'

feature 'user goes to home page', %{
  As a user
  I want to go to my home page
  So that I can see my lastest updates and profile

  Acceptance Criteria
  []Users should see home icon and sub-nav bar
  []User should see their profile block which includes
    name, title, email, address, city, state, zip, phone
  []User should see settings button to change their profile
  []User should see checkin button to change their profile
  []User should see checkin their checkins
} do
  feature "user is signed in" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @group = FactoryGirl.create(:group, primary_user: @user)
      @checkin = FactoryGirl.create(:checkin, user: @user)
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      visit user_path(@user.id)
    end

    scenario 'Users should see home icon and sub-nav bar' do

      expect(page).to have_content('Profile')
      expect(page).to have_content('Groups')
      expect(page).to have_content('Tasks')
      expect(page).to have_content('Contacts')
      expect(page).to have_content('Files')
      expect(page).to have_content('Sign Out')
    end

    scenario 'User should see their profile block' do

      expect(page).to have_content(@user.name)
      expect(page).to have_content(@user.title)
      expect(page).to have_content(@user.display_address)
      expect(page).to have_content(@user.display_phone)
      expect(page).to have_xpath(
        "//img[@src=\"/uploads/user/profile_photo/#{@user.id}/example_image.jpg\"]"
      )
      expect(@user.profile_photo.file.filename).to eq("example_image.jpg")
    end

    scenario 'User should see settings and checkin button to change their profile' do
      expect(page).to have_link("Settings")
      expect(page).to have_link("Check-In")
    end

    scenario 'User should see checkin their checkins' do
      expect(page).to have_content(@checkin.address)
      expect(page).to have_content(@checkin.when)
      expect(page).to have_content(@checkin.message)
    end
  end
end
