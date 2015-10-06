require 'rails_helper'

feature 'user goes to contact index page', %{
  As a user
  I want to go to my contacts page
  So that I can see the contact list

  Acceptance Criteria
  []Users should see contacts link in sub-nav bar
  []User should see the list of their contacts
  []User can click div to link to show page
} do
  feature "user is signed in" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      visit user_path(@user.id)
    end

    scenario 'Users should see group link in sub-nav bar' do
      expect(page).to have_content('Contacts')
    end

    scenario 'User should see the details of their contacts' do
      group = FactoryGirl.create(:group, primary_user: @user)
      FactoryGirl.create(:membership, user: @user, group: group)
      contact = FactoryGirl.create(:contact, group: group)
      click_link 'Contacts'
      expect(page).to have_content(contact.first_name)
      expect(page).to have_content(contact.last_name)
      expect(page).to have_content(contact.company_name)
      expect(page).to have_content(contact.category)
      expect(page).to have_content(contact.phone)
      expect(page).to have_content(contact.phone_ext)
    end

    scenario 'User can click div to link to show page' do

    end
  end
end
