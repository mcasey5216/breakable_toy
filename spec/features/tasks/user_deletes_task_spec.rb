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
      @task = FactoryGirl.create(:task, group_id: @group.id)
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      visit task_path(@task)
    end

    scenario 'Users see the delete button on show page' do
      page.should have_link("Delete Task")
    end

    scenario 'Users see the delete button on show page' do
      click_link "Delete Task"

      expect(current_path).to eq(group_path(@group))
      expect(page).to have_content("Task has been deleted from #{@task.group.name}.")
      expect(page).to_not have_content(@task.title)
    end
  end
end
