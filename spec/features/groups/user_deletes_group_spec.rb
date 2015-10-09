require 'rails_helper'

feature 'user deletes a group', %{
  As a user
  I want to delete a group
  So that I can declutter my groups

  Acceptance Criteria
  []Users see the delete button on show page
  []User can delete group
} do
  feature "user is signed in" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @group = FactoryGirl.create(:group, primary_user: @user)
      FactoryGirl.create(:membership, user: @user, group: @group)
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      visit group_path(@group)
    end

    scenario 'Users see the delete button on show page' do
      page.should have_link("Delete Group")
    end

    scenario 'Users see the delete button on show page' do
      click_link "Delete Group"
      expect(page).to have_content("Group has been deleted.")
      expect(page).to_not have_content(@group.name)
    end
  end
end
