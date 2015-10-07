require 'rails_helper'

feature 'user goes to group show page', %{
  As a user
  I want to go to a group's show page
  So that I can see the group details

  Acceptance Criteria
  []Users should see the group info
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

    scenario 'User should see the details of the group' do
      group = FactoryGirl.create(:group, primary_user: @user)
      FactoryGirl.create(:membership, user: @user, group: group)
      click_link 'Groups'
      click_link "#{group.name}"
      expect(page).to have_content("Main Contact:")
      expect(page).to have_content(group.primary_user.first_name)
      expect(page).to have_content(group.primary_user.last_name)
      expect(page).to have_content(group.primary_user.email)
      expect(page).to have_content(group.name)
      expect(page).to have_content(group.description)
    end
  end
end
