require 'rails_helper'

feature 'user goes to membership index page', %{
  As a user
  I want to go to the membership page
  So that I can add users to groups and tasks

  Acceptance Criteria
  []if user is adding to a group, they should see the group name
  []if user clicks on user, user is added to the group
  []if user is adding to a task, they should see the task title
  []if user clicks on user, user is added to the task
} do
  feature "user is signed in" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @user2 = FactoryGirl.create(:user)
      @group = FactoryGirl.create(:group, primary_user: @user)
      @task = FactoryGirl.create(:task, group: @group)
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      visit user_path(@user.id)
      FactoryGirl.create(:membership, user: @user, group: @group, task: @task)
    end

    scenario 'if user is adding to a group, they should see the group name' do
      visit group_path(@group)
      click_link "Add Users"
      expect(current_path).to eq(group_memberships_path(@group))

      expect(page).to have_content(@group.name)
      page.should have_button(@user2.email)
    end

    scenario 'if user clicks on user, user is added to the group' do
      visit group_path(@group)
      click_link "Add Users"
      expect(current_path).to eq(group_memberships_path(@group))
      click_button "#{@user2.email}"
      expect(current_path).to eq(group_path(@group))

      expect(page).to have_content(@group.name)
      expect(page).to have_content(@user2.name)
    end

    scenario 'if user is adding to a group, they should see the task title' do
      visit task_path(@task)
      click_link "Add Users"
      expect(current_path).to eq(task_memberships_path(@task))

      expect(page).to have_content(@task.title)
      page.should have_button(@user2.email)
    end

    scenario 'if user clicks on user, user is added to the task' do
      visit task_path(@task)
      click_link "Add Users"
      expect(current_path).to eq(task_memberships_path(@task))

      click_button "#{@user2.email}"
      expect(current_path).to eq(task_path(@task))

      expect(page).to have_content(@task.title)
      page.should have_link(@user2.name)
    end
  end
end
