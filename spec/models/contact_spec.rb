require 'rails_helper'

RSpec.describe Contact, type: :model do
  it { should belong_to :group }

  it { should have_valid(:email).when("email@gmail.com", "gmail@email.com") }
  it { should_not have_valid(:email).when(nil, '', 'zest.com') }

  it { should have_valid(:first_name).when("bob", "billy") }
  it { should_not have_valid(:first_name).when(nil, '') }

  it { should have_valid(:last_name).when("bob", "billy") }
  it { should_not have_valid(:last_name).when(nil, '') }

  it { should have_valid(:company_name).when("lead", "other leader") }

  it { should have_valid(:address).when("123 place rd", "456 other dr") }
  it { should_not have_valid(:address).when(nil, '') }

  it { should have_valid(:city).when("boston", "philadelphia") }
  it { should_not have_valid(:city).when(nil, '') }

  it { should have_valid(:state).when("ma", "pa") }
  it { should_not have_valid(:state).when(nil, '', 'mass') }

  it { should have_valid(:zip).when("12345", "04567") }
  it { should_not have_valid(:zip).when(nil, '', '123') }

  it { should have_valid(:phone).when(1234567890, 1987654321) }
  it { should_not have_valid(:phone).when('purple', 1234) }

  it { should have_valid(:phone_ext).when("045", "1245") }

  it { should have_valid(:category).when("Electrican", "Plumber") }

  it { should have_valid(:description).when("closes at 8", "On vacation until 1/1") }
end
