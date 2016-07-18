FactoryGirl.define do
  factory :game do
    sequence(:name) { |n| 'game of thrones#{n}' }
    genre 'Family'
    designer 'Parker Bros'
    description 'A deadly game of chance'
    max_players '4'
    min_players '2'
    max_playtime '15'
    min_playtime '35'
    year 2012
  end
end
