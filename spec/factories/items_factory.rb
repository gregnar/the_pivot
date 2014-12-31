FactoryGirl.define do

  factory :order do
    delivery false
  end


  factory :potable_water, class: Item do
    title 'Potable water'
    description '20 gallon weather-proof container.'
    price 12.50
  end

  factory :sand_bags, class: Item do
    title 'Sand Bags'
    description '40lbs each. Build barriers during natural disasters.'
    price 15.99
  end

  factory :emergency_meals, class: Item do
    title 'R&H Brand Emergecy Meal Kit'
    description "32 servings per kit, one meal per serving. Includes Salisbury Steak, Lasagna, Shephard's Pie, and Pork Chop dinners."
    price 95.99
  end

  factory :bulk_rice, class: Item do
    title 'Bulk Rice'
    description '20 lbs each. Jasmine rice. Non-perishable.'
    price 10.95
  end

  factory :flashlight, class: Item do
    title 'Killarney Brand Flashlight'
    description 'Extra long battery life. Waterproof.'
    price 25.99
  end

  factory :penicillin, class: Item do
    title 'Penicillin'
    description 'Emergency Penicillin supply from Bayer. 50 capsules per bottle.'
    price 75.59
  end

  factory :birthing_kit, class: Item do
    title 'Birthing Kit'
    description 'Emergency Birthing Kit. Includes baby formula.'
    price 50.02
  end

  factory :bedding_kit, class: Item do
    title 'Bedding Kit'
    description 'Emergency Bedding Kit. Includes cot, sleeping pad, blanket and pillow'
    price 68.04
  end

  factory :baby_formula do
    title 'Baby Formula'
    description 'Powdered formula. 5 lbs.'
    price 42.38
  end

  factory :UtilityKnife, class: Item do
    title "Utility Knife"
    description 'This knife is excellent for cutting utilities.'
    price 18.99
  end

  factory :Diapers, class: Item do
    title "Diapers"
    description 'Diapers for diapering infants.  25 count.'
    price 59.99
  end

  factory :FireStarterKit, class: Item do
    title "Fire Starter Kit"
    description "With no electricity, you will need to start fires.  You're welcome."
    price 229.99
  end

  factory :WaterFiltration, class: Item do
    title "Water Filtration"
    description 'Make your water clean.'
    price 74.99
  end

  factory :WaterStorageTank, class: Item do
    title "Water Storage Tank"
    description 'Store your water.'
    price 199.99
  end

  factory :Hatchet, class: Item do
    title "Hatchet"
    description 'Defend yourself from bandits.'
    price 39.99
  end

  factory :Batteries, class: Item do
    title "Batteries"
    description 'Batteries to power your appliances.  8 count.'
    price 299.99
  end

  factory :PowderedMilk, class: Item do
    title "Powdered Milk"
    description 'Delicious quality milk in powder form, just add water.'
    price 19.99
  end

  factory :BulkSalt, class: Item do
    title "Bulk Salt"
    description 'Large amounts of salt to preserve you food.'
    price 19.99
  end

  factory :BulkSugar, class: Item do
    title "Bulk Sugar"
    description 'Your going to want to put some sugar on the foul stuff you will be eating.'
    price 29.99
  end

  factory :BulkFlour, class: Item do
    title "Bulk Flour"
    description 'In case you want to bake tens of thousands of loaves of bread.'
    price 29.99
  end

  factory :BulkCannedBeans, class: Item do
    title "Bulk Canned Beans"
    description "Beans:  It's whats for dinner."
    price 14.99
  end

  factory :Boots, class: Item do
    title "Boots"
    description 'Great for trudging through a wasteland of destruction.'
    price 79.99
  end

  factory :Iodine, class: Item do
    title "Iodine"
    description 'Use it to clean water and wounds.'
    price 19.99
  end

  factory :DisasterTent, class: Item do
    title "Disaster Tent"
    description 'You want to sleep in the rain?  No?  Then you MUST buy this tent.'
    price 159.99
  end

  factory :SleepingBag, class: Item do
    title "Needles"
    description 'You want to sleep on the dirt?  No?  Then you MUST buy this sleeping bag.'
    price 59.99
  end

  factory :DuctTape, class: Item do
    title "Duct Tape"
    description 'Great for taping things together.'
    price 8.99
  end

  factory :Gauze, class: Item do
    title "Gauze"
    description 'Bandage wounds.'
    price 9.99
  end

  factory :PortableHeater, class: Item do
    title "Portable Heater"
    description 'Heat your disaster tent.'
    price 149.99
  end

  factory :PropaneTank, class: Item do
    title "Propane Tank"
    description 'This tank will let you cook stuff.'
    price 99.99
  end

  factory :Poncho, class: Item do
    title "Poncho"
    description 'This poncho will keep you dry in the rain.'
    price 69.99
  end

  factory :WorkGloves, class: Item do
    title "Work Gloves"
    description 'These gloves will keep your hands from getting cut to shreds.'
    price 17.99
  end

  factory :Generator, class: Item do
    title "Generator"
    description 'Use this so you will have electricity.'
    price 349.99
  end

  factory :InflatableRaft, class: Item do
    title "Inflatable Raft"
    description 'Unless you want to swim around to rescue people, you need this raft.'
    price 179.99
  end

  factory :TetanusShots, class: Item do
    title "Tetanus Shots"
    description 'Guaranteed to keep you tetanus free.  3 count.'
    price 749.99
  end

  factory :FirstAidKit, class: Item do
    title "First Aid Kit"
    description 'Great for treating wounds and minor ailments.'
    price 89.99
  end

  factory :SchoolKit, class: Item do
    title "School Kit"
    description 'Teach school to children who have recently had their homes destroyed.'
    price 129.99
  end

  factory :HandSanitizer, class: Item do
    title "Hand Sanitizer"
    description 'Keep your hands clean.'
    price 24.99
  end



end
