require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should belong_to :user }
  it { should belong_to :group }
  it { should belong_to :task }
  it { should belong_to :contact }

  it { should have_valid(:body).when("Blah", "Blah Blah") }
  it { should_not have_valid(:body).when(nil, '') }
end
