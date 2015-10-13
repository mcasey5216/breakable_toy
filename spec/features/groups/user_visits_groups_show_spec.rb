require 'rails_helper'

feature 'user goes to group show page', %{
  As a user
  I want to go to a group's show page
  So that I can see the group details

  Acceptance Criteria
  []Users should see the group info
  []Users should see side nav with users, tasks, and contacts
} do
  feature "user is signed in" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @user2 = FactoryGirl.create(:user)
      @group = FactoryGirl.create(:group, primary_user: @user)
      FactoryGirl.create(:membership, user: @user, group: @group)
      FactoryGirl.create(:membership, user: @user2, group: @group)
      @task = FactoryGirl.create(:task, group: @group)
      @contact = FactoryGirl.create(:contact, group: @group)
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      visit user_path(@user.id)
      click_link 'Groups'
      click_link "#{@group.name}"
    end

    scenario 'User should see the details of the group' do
      expect(page).to have_content("primary")
      expect(page).to have_content(@group.primary_user.name)
      expect(page).to have_content(@group.primary_user.email)
      expect(page).to have_content(@group.name)
      expect(page).to have_content("details")
      expect(page).to have_content(@group.description)
    end

    scenario 'Users should see side nav with users, tasks, and contacts' do
      expect(page).to have_content("Team")
      expect(page).to have_content(@user2.name)
      expect(page).to have_content("Tasks")
      expect(page).to have_content(@task.title)
      expect(page).to have_content("Contacts")
      expect(page).to have_content(@contact.company_name)
    end
  end
end
