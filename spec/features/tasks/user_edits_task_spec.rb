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
      @group = FactoryGirl.create(:group, primary_user: @user)
      @task = FactoryGirl.create(:task, group_id: @group.id)
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      visit task_path(@task)
      click_link "Update Task"
    end

    scenario 'User should be able to navigate to new page from group show' do
      expect(current_path).to eq(edit_task_path(@task))
    end

    scenario 'User should see the form' do
      find_field("Title")
      find_field("Description")
    end

    scenario 'User should be alerted if successful' do
      fill_in "Title", with: "Task"
      fill_in "Description", with: "Task Description"
      click_button "Update Task"

      expect(current_path).to eq(task_path(@task))
      expect(page).to have_content("#{Task.last.title} has been updated.")
    end

    scenario 'User should be alerted if unsuccessful' do
      fill_in "Title", with: ""
      click_button "Update Task"

      expect(page).to have_content("can't be blank")
    end
  end
end
