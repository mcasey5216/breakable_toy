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
      FactoryGirl.create(:membership, user: @user, group: @group)
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      visit user_path(@user.id)
      click_link 'Groups'
      click_link "#{@group.name}"
      click_link 'Create Task'
    end

    scenario 'User should be able to navigate to new page from group show' do
      expect(current_path).to eq(new_group_task_path(@group))
    end

    scenario 'User should see the form' do
      find_field("Title")
      find_field("Description")
    end

    # scenario 'User should be alerted if successful' do
    #   page.all("input['name=task[group_id]']",
          # :visible => false).first.set(@group)
    #   fill_in "Title", with: "task"
    #   fill_in "Description", with: "description"
    #   click_button "Create Task"
    #
    #   expect(current_path).to eq(group_task_path(@group))
    #   expect(page).to have_content("Task Created")
    # end

    # scenario 'User should be alerted if unsuccessful' do
    #   find('#task_group_id', visible: false).value(@group)
    #   click_button "Create Task"
    #
    #   expect(current_path).to eq(new_group_task_path(@group))
    #   expect(page).to have_content("can't be black")
    # end
  end
end
