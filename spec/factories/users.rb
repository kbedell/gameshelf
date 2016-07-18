FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| 'person#{n}@example.com' }
    first_name 'Tyrion'
    last_name 'Lannister'
    password 'theImp'
    password_confirmation 'theImp'
  end
end
