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
      click_link "#{contact.company_name}"
      expect(page).to have_content(contact.name)
      expect(page).to have_content(contact.company_name)
      expect(page).to have_content(contact.category)
      expect(page).to have_content(contact.display_phone)
      expect(page).to have_content(contact.display_address)
      expect(page).to have_content(contact.description)
      expect(page).to have_content(contact.group.name)
    end
  end
end
