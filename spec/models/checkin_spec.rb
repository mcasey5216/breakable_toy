require 'rails_helper'

RSpec.describe Checkin, type: :model do
  it { should belong_to :user }
  it { should belong_to :contact }

  it { should have_valid(:latitude).when(58.25, 8.0) }
  it { should_not have_valid(:latitude).when("one") }

  it { should have_valid(:longitude).when(58.25, 8.0) }
  it { should_not have_valid(:longitude).when("one") }
end
