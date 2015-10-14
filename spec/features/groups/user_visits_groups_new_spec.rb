require 'rails_helper'

feature 'user goes to group new page', %{
  As a user
  I want to go to a group's new page from group index
  So that I can make a new group

  Acceptance Criteria
  []User should be able to navigate to new page from group index
  []User should see the form
  []User should be alerted if successful
  []User should be alerted if unsuccessful
} do
  feature "user is signed in" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      visit new_group_path
    end

    scenario 'User should be able to navigate to new page from group show' do
      expect(current_path).to eq(new_group_path)
    end

    scenario 'User should see the form' do
      find_field("Name")
      find_field("Description")
    end

    scenario 'User should be alerted if successful' do
      fill_in "Name", with: "Group"
      fill_in "Description", with: "Group Description"
      click_button "Create Group"

      expect(current_path).to eq(group_path(Group.last))
      expect(page).to have_content("Group Created")
    end

    scenario 'User should be alerted if unsuccessful' do
      click_button "Create Group"

      expect(page).to have_content("can't be blank")
    end
  end
end
