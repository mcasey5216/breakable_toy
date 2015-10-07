require 'rails_helper'

feature 'user goes to contact show page', %{
  As a user
  I want to go to a contact's show page
  So that I can see the contact details

  Acceptance Criteria
  []Users should see the contacts info
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

    scenario 'User should see the details of their contact' do
      group = FactoryGirl.create(:group, primary_user: @user)
      FactoryGirl.create(:membership, user: @user, group: group)
      contact = FactoryGirl.create(:contact, group: group)
      click_link 'Contacts'
      click_link 'Company:'
      expect(page).to have_content(contact.first_name)
      expect(page).to have_content(contact.last_name)
      expect(page).to have_content(contact.company_name)
      expect(page).to have_content(contact.category)
      expect(page).to have_content(contact.phone)
      expect(page).to have_content(contact.phone_ext)
      expect(page).to have_content(contact.address)
      expect(page).to have_content(contact.city)
      expect(page).to have_content(contact.state)
      expect(page).to have_content(contact.zip)
      expect(page).to have_content(contact.description)
      expect(page).to have_content(contact.group.name)
    end
  end
end
