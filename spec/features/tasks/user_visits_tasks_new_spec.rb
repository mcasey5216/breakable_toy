require 'rails_helper'

feature 'user goes to task new page', %{
  As a user
  I want to go to a task's new page from group page
  So that I can make a new task

  Acceptance Criteria
  []User should be able to navigate to new page from group show
  []User should see the form
  []User should be alerted if successful
  []User should be alerted if unsuccessful
} do
  feature "user is signed in" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @group = FactoryGirl.create(:group, primary_user: @user)
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      visit new_group_task_path(@group.id)
    end

    scenario 'User should be able to navigate to new page from group show' do
      expect(current_path).to eq(new_group_task_path(@group))
    end

    scenario 'User should see the form' do
      find_field("Title")
      find_field("Description")
    end

    scenario 'User should be alerted if successful' do
      fill_in "Title", with: "task"
      fill_in "Description", with: "description"
      click_button "Create Task"

      expect(current_path).to eq(task_path(Task.last))
      expect(page).to have_content("Task Created")
    end

    scenario 'User should be alerted if unsuccessful' do
      click_button "Create Task"

      expect(current_path).to eq(new_group_task_path(@group))
      expect(page).to have_content("can't be blank")
    end
  end
end
