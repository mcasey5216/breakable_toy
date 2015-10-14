require 'rails_helper'

feature 'user goes to task show page', %{
  As a user
  I want to go to a task's show page
  So that I can see the task details

  Acceptance Criteria
  []Users should see the task info
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

    scenario 'User should see the details of the task' do
      group = FactoryGirl.create(:group, primary_user: @user)
      task = FactoryGirl.create(:task, group: group)
      membership = FactoryGirl.create(
        :membership, user: @user, group: group, task: task
      )
      click_link 'Tasks'
      click_link "#{task.title}"
      expect(page).to have_content(task.title)
      expect(page).to have_content(task.group.name)
      expect(page).to have_content(task.description)
      expect(page).to have_content(@user.first_name)
      expect(page).to have_content(@user.last_name)
      expect(page).to have_content(@user.name)
    end
  end
end
