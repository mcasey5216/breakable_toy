require 'rails_helper'

RSpec.describe Attachment, type: :model do
  it { should belong_to :group }

  it { should have_valid(:name).when("Blah", "Blah Blah") }
  it { should_not have_valid(:name).when(nil, '') }
end
