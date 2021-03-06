require 'rails_helper'

describe Game, type: :model do
  describe 'validation' do
    it { should have_many(:users).through(:usersgames) }
    it { should have_many :usersgames }

    it { should have_valid(:name).when('Settlers of Catan', 'Tokaido') }
    it { should_not have_valid(:name).when('', nil) }

    it { should have_valid(:max_players).when('4', '5') }
    it { should_not have_valid(:max_players).when('', nil) }

    it { should have_valid(:min_players).when('3', '2') }
    it { should_not have_valid(:min_players).when('', nil) }

    it { should have_valid(:max_playtime).when('90', '45') }
    it { should_not have_valid(:max_playtime).when('', nil) }

    it { should have_valid(:min_players).when('60', '45') }
    it { should_not have_valid(:min_players).when('', nil) }

    it { should have_valid(:year).when('2012', '2012') }
    it { should_not have_valid(:year).when('', nil) }

    subject { FactoryGirl.build(:game) }
    it { should validate_uniqueness_of(:name).scoped_to(:year) }
  end
end
