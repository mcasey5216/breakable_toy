require 'rails_helper'

feature 'user goes to attachment index page', %{
  As a user
  I want to go to my attachments page
  So that I can see the attachments list

  Acceptance Criteria
  []user can add a file from group show page
  []User should see the list of their attachments
} do
  feature "user is signed in" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @group = FactoryGirl.create(:group, primary_user: @user)
      FactoryGirl.create(:membership, user: @user, group: @group)
      @attachment = FactoryGirl.create(:attachment, group: @group)
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
    end

    scenario 'user can add a file from group show page' do
      visit group_path(@group)
      click_link "Attach File"
      expect(current_path).to eq(new_group_attachment_path(@group))

      fill_in "Name", with: "Name"
      attach_file "Attachment", "#{Rails.root}/spec/support/images/example_file.pdf"
      click_button "Attach file"

      expect(page).to have_content("Attachment successfully uploaded")
    end

    scenario 'User should see the list of their attachments' do
      visit attachments_path
# save_and_open_page
      expect(page).to have_content(@attachment.name)
      expect(page).to have_content(@attachment.group.name)
    end
  end
end
