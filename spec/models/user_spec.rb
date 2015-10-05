require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_valid(:email).when("email@gmail.com", "gmail@email.com") }
  it { should_not have_valid(:email).when(nil, '', 'zest.com') }

  it { should have_valid(:password).when("password", "hellothere") }
  it { should_not have_valid(:password).when(nil, '', 'test') }

  it { should have_valid(:first_name).when("bob", "billy") }
  it { should_not have_valid(:first_name).when(nil, '') }

  it { should have_valid(:last_name).when("bob", "billy") }
  it { should_not have_valid(:last_name).when(nil, '') }

  it { should have_valid(:title).when("lead", "other leader") }

  it { should have_valid(:address).when("123 place rd", "456 other dr") }

  it { should have_valid(:city).when("boston", "philadelphia") }
  it { should_not have_valid(:city).when(nil, '') }

  it { should have_valid(:state).when("ma", "pa") }
  it { should_not have_valid(:state).when(nil, '', 'mass') }

  it { should have_valid(:zip).when("12345", "04567") }
  it { should_not have_valid(:zip).when(nil, '', '123') }

  it "should not accept nonunique emails" do
    FactoryGirl.create(:user, email: "bob@gmail.com", password: "password")
    user = User.new(email: "bob@gmail.com", password: "wordpass")
    expect(user.valid?).to eq(false)
    expect(user.errors.full_messages[0]).to eq("Email has already been taken")
  end
end
