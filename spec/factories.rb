FactoryGirl.define do  factory :order do
    delivery false
  end

  factory :user do
    name 'Cave Johnson'
    email { Faker::Internet.email }
    password 'foobar'
    password_confirmation 'foobar'
  end

  factory :admin, class: User do
    name 'Admin User'
    email { Faker::Internet.email }
    password 'foobar'
    password_confirmation 'foobar'
    admin true
  end

  factory :address do
    street_number { Faker::Address.building_number }
    street_name { Faker::Address.street_name }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    zip_code { Faker::Address.zip }
    user_id 0
  end

  factory :category do
    name 'food'
  end

  factory :item do
    title 'Sand Bags'
    description 'Sand bags for all your flood needs'
    price 2.99
    association :supplier, factory: :supplier

  end

  factory :supplier do
    name 'Red Cross'
    description 'Providing relief to people since 1934.'
    email { Faker::Internet.email }
    phone '1234567890'
  end

end
