FactoryGirl.define do

  factory :medical, class: Category do
    name 'Medical and Hygiene'
  end

  factory :food_and_water, class: Category do
    name 'Food and Water'
  end

  factory :energy_and_heat, class: Category do
    name 'Energy and Heat'
  end

  factory :childcare, class: Category do
    name 'Childcare'
  end

  factory :clothing, class: Category do
    name 'Clothing'
  end

  factory :flood_relief, class: Category do
    name 'Flood Relief'
  end

  factory :tools, class: Category do
    name 'Tools'
  end

  factory :shelter_bedding, class: Category do
    name 'Shelter and Bedding'
  end

end
