require 'rails_helper'

RSpec.describe Group, type: :model do
  it { should belong_to :primary_user }
  it { should have_many :memberships }
  it { should have_many(:users).through(:memberships) }
  it { should have_many(:tasks).through(:memberships) }

  it { should have_valid(:name).when("Group", "Group 2") }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:description).when("describe", "hellothere") }
  it { should_not have_valid(:description).when(nil, '') }
end
