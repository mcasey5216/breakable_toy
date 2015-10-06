require 'rails_helper'

feature 'user goes to task index page', %{
  As a user
  I want to go to my tasks page
  So that I can see the task info

  Acceptance Criteria
  []Users should see tasks link in sub-nav bar
  []User should see the details of their tasks
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

    scenario 'Users should see task link in sub-nav bar' do
      expect(page).to have_content('Tasks')
    end
    scenario 'User should see the details of their tasks' do
      task = FactoryGirl.create(:task)
      membership = FactoryGirl.create(:membership, user: @user, task: task)
      click_link 'Tasks'
      expect(page).to have_content(task.title)
      expect(page).to have_content(task.description)
      expect(page).to have_content(membership.group.name)
    end
  end
end
