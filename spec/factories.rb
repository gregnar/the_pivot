FactoryGirl.define do  factory :order do
    delivery false
  end

  factory :user do
    name 'Bad User'
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
    display_name ''
    supplier_admin true
    admin false
    association :supplier, factory: :supplier
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

  factory :item2, class: Item do
    title "Needles"
    description 'Shot shots shot shots shots'
    price 3.10
    association :supplier, factory: :supplier
  end

  factory :supplier do
    name 'Red Cross'
    description 'Providing relief to people since 1934.'
    email { Faker::Internet.email }
    phone '1234567890'
  end

  factory :torta_shop, class: Supplier do
    name "Torta's Supplies"
    email { Faker::Internet.email }
    phone "1-(720)-303-6098"
    fax "1-(720)-946-7839"
    description  "We are a super-special service for airdropped mexican sandwiches.
    They raise morale and promote Jorge's happiness!"
  end

  factory :nba_cares, class: Supplier do
    name "NBA Cares"
    email { Faker::Internet.email }
    phone "1-(303)-693-9048"
    fax "1-(720)-590-3204"
    description "We joined Airlyft because we believe in basketball's healing quality
    Do you want to enrich children all over? Use NBA supplies to build high-quality courts wholewide!"
  end

  factory :hoop, class: :Item do
    title "NBA Hoop"
    description 'Now with Shaq-proof backboards'
    price { Faker::Commerce.price }
    photo_file_name nil
    photo_content_type 'image/png'
    photo_file_size { Faker::Number.number(3) }
    photo_updated_at { Faker::Date.between(1.week.ago, Date.today) }
    active true
  end

  factory :lechuga, class: :Item do
    title "Torta Lechuga"
    description "Fresh crunchy veggie filler for our fabulous tortas."
    price { Faker::Commerce.price }
    photo_file_name nil
    photo_content_type 'image/png'
    photo_file_size { Faker::Number.number(3) }
    photo_updated_at { Faker::Date.between(1.week.ago, Date.today) }
    active true
  end
end
