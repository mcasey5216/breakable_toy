require 'rails_helper'

feature 'user goes to group index page', %{
  As a user
  I want to go to my groups page
  So that I can see the group info

  Acceptance Criteria
  []Users should see group link in sub-nav bar
  []User should see the details of their groups
  []User should see settings button if primary_user
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
      expect(page).to have_content('Groups')
    end
    scenario 'User should see the details of their groups' do
      group = FactoryGirl.create(:group, primary_user: @user)
      FactoryGirl.create(:membership, user: @user, group: group)
      click_link 'Groups'
      expect(page).to have_content(group.name)
      expect(page).to have_content(group.description)
    end
  end
end
