require 'rails_helper'

RSpec.describe Task, type: :model do
  it { should belong_to :group }
  it { should have_many :memberships }
  it { should have_many(:users).through(:memberships) }
  it { should have_db_column(:completed).of_type(:boolean) }

  it { should have_valid(:title).when("Group", "Group 2") }
  it { should_not have_valid(:title).when(nil, '') }

  it { should have_valid(:description).when("describe", "hellothere") }
  it { should_not have_valid(:description).when(nil, '') }
end
