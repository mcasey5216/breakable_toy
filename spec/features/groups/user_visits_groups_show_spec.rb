require 'rails_helper'

feature 'user goes to group show page', %{
  As a user
  I want to go to a group's show page
  So that I can see the group details

  Acceptance Criteria
  []Users should see the group info
  []Users should see side nav with users, tasks, contacts, and files
  []Users should see the comments form
  []User should be able to submit a new comment
  []Users should see all comments
} do
  feature "user is signed in" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @user2 = FactoryGirl.create(:user)
      @group = FactoryGirl.create(:group, primary_user: @user)
      @task = FactoryGirl.create(:task, group: @group)
      @contact = FactoryGirl.create(:contact, group: @group)
      @attachment = FactoryGirl.create(:attachment, group: @group)
      @comment = FactoryGirl.create(:comment, user: @user, group: @group)
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      visit group_path(@group)
      FactoryGirl.create(:membership, user: @user, group: @group)
      FactoryGirl.create(:membership, user: @user2, group: @group)
    end

    scenario 'User should see the details of the group' do
      expect(page).to have_content("primary")
      expect(page).to have_content(@group.primary_user.name)
      expect(page).to have_content(@group.primary_user.email)
      expect(page).to have_content(@group.name)
      expect(page).to have_content("details")
      expect(page).to have_content(@group.description)
    end

    scenario 'Users should see side nav with users, tasks, contacts, and files' do
      expect(page).to have_content("Team")
      expect(page).to have_content(@user2.name)
      expect(page).to have_content("Tasks")
      expect(page).to have_content(@task.title)
      expect(page).to have_content("Contacts")
      expect(page).to have_content(@contact.company_name)
      expect(page).to have_content("Files")
      expect(page).to have_content(@attachment.name)
    end

    scenario 'Users should see the comments form' do
      find("#comment_body")
    end

    scenario 'User should be able to submit a new comment' do
      fill_in "comment_body", with: "My brand new comment"
      click_button "Post Comment"

      expect(page).to have_content("My brand new comment")
    end

    scenario 'Users should see all comments' do
      expect(page).to have_content(@comment.body)
      expect(page).to have_content(@comment.when)
      expect(page).to have_content(@comment.user.name)
    end
  end
end
