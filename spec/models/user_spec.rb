require 'rails_helper'

describe User, type: :model do
  describe 'validation' do
    it { should have_many(:games).through(:usersgames) }
    it { should have_many(:usersgames).dependent(:delete_all)}

    it { should have_valid(:first_name).when('John', 'Sally') }
    it { should_not have_valid(:first_name).when('', nil) }

    it { should have_valid(:email).when('user@example.com', 'another@gmail.com') }
    it { should_not have_valid(:email).when(nil, '', 'urser', 'usersba.com') }

    subject { FactoryGirl.build(:user) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  it 'has a matching password confirmation for password' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = 'another_password'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end
end
