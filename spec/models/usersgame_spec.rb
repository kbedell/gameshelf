require 'rails_helper'

describe Usersgame, type: :model do

  describe "validation" do
    it { should belong_to(:user).dependent(:destroy)}
    it { should belong_to :game}

    it { should have_valid(:user_id).when(1, 2) }
    it { should_not have_valid(:user_id).when("", nil) }

    it { should have_valid(:game_id).when(3, 4) }
    it { should_not have_valid(:game_id).when("", nil) }

    subject { FactoryGirl.create(:usersgame) }
    it { should validate_uniqueness_of(:game_id).scoped_to(:user_id) }
  end
end
