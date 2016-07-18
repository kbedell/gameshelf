FactoryGirl.define do
  factory :usersgame do |usersgame|
    usersgame.association :user
    usersgame.association :game
  end
end
