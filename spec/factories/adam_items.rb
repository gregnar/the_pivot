FactoryGirl.define do  

  factory :UtilityKnife, class: Item do
    title "Utility Knife"
    description 'This knife is excellent for cutting utilities'
    price 3.10
    association :supplier, factory: :supplier
  end

  factory :Diapers, class: Item do
    title "Diapers"
    description 'Diapers for diapering infants'
    price 3.10
    association :supplier, factory: :supplier
  end

  factory :FireStarterKit, class: Item do
    title "Fire Starter Kit"
    description "With no electricity, you will need to start fires.  You're welcome."
    price 3.10
    association :supplier, factory: :supplier
  end

  factory :WaterFiltration, class: Item do
    title "Water Filtration"
    description 'Make your water clean'
    price 3.10
    association :supplier, factory: :supplier
  end

  factory :WaterStorageTank, class: Item do
    title "Water Storage Tank"
    description 'Store your water'
    price 3.10
    association :supplier, factory: :supplier
  end

  factory :Hatchet, class: Item do
    title "Hatchet"
    description 'Defend yourself from bandits'
    price 3.10
    association :supplier, factory: :supplier
  end

  factory :Batteries, class: Item do
    title "Batteries"
    description 'Batteries to power your appliances'
    price 3.10
    association :supplier, factory: :supplier
  end

  factory :PowderedMilk, class: Item do
    title "Powdered Milk"
    description 'Delicious quality milk in powder form, just add water'
    price 3.10
    association :supplier, factory: :supplier
  end

  factory :BulkSalt, class: Item do
    title "Bulk Salt"
    description 'Large amounts of salt to preserve you food'
    price 3.10
    association :supplier, factory: :supplier
  end

  factory :BulkSugar, class: Item do
    title "Bulk Sugar"
    description 'Your going to want to put some sugar on the fowl stuff you will be eating'
    price 3.10
    association :supplier, factory: :supplier
  end

  factory :BulkFlour, class: Item do
    title "Bulk Flour"
    description 'In case you want to bake tens of thousands of loaves of bread'
    price 3.10
    association :supplier, factory: :supplier
  end

  factory :BulkCannedBeans, class: Item do
    title "Bulk Canned Beans"
    description "Beans:  It's whats for dinner"
    price 3.10
    association :supplier, factory: :supplier
  end

  factory :Boots, class: Item do
    title "Boots"
    description 'Great for trudging through a wasteland of destruction'
    price 3.10
    association :supplier, factory: :supplier
  end

  factory :Iodine, class: Item do
    title "Iodine"
    description 'Use it to clean water and wounds'
    price 3.10
    association :supplier, factory: :supplier
  end

  factory :DisasterTent, class: Item do
    title "Disaster Tent"
    description 'You want to sleep in the rain?  No?  Then you MUST buy this tent'
    price 3.10
    association :supplier, factory: :supplier
  end

  factory :SleepingBag, class: Item do
    title "Needles"
    description 'You want to sleep on the dirt?  No?  Then you MUST buy this sleeping bag'
    price 3.10
    association :supplier, factory: :supplier
  end

  factory :DuctTape, class: Item do
    title "Duct Tape"
    description 'Great for taping things together'
    price 3.10
    association :supplier, factory: :supplier
  end

  factory :Gauze, class: Item do
    title "Gauze"
    description 'Bandage wounds'
    price 3.10
    association :supplier, factory: :supplier
  end

  factory :PortableHeater, class: Item do
    title "Portable Heater"
    description 'Heat your disaster tent'
    price 3.10
    association :supplier, factory: :supplier
  end

  factory :PropaneTank, class: Item do
    title "Propane Tank"
    description 'This tank will let you cook stuff'
    price 3.10
    association :supplier, factory: :supplier
  end

  factory :Poncho, class: Item do
    title "Poncho"
    description 'This poncho will keep you dry in the rain'
    price 3.10
    association :supplier, factory: :supplier
  end

  factory :WorkGloves, class: Item do
    title "Work Gloves"
    description 'These gloves will keep your hands from getting cut to shreds'
    price 3.10
    association :supplier, factory: :supplier
  end

  factory :Generator class: Item do
    title "Generator"
    description 'Use this so you will have electricity'
    price 3.10
    association :supplier, factory: :supplier
  end

  factory :InflatableRaft, class: Item do
    title "Inflatable Raft"
    description 'Unless you want to swim around to rescue people, you need this raft'
    price 3.10
    association :supplier, factory: :supplier
  end

  factory :TetanusShots, class: Item do
    title "Tetanus Shots"
    description 'Guaranteed to keep you tetanus free'
    price 3.10
    association :supplier, factory: :supplier
  end

  factory :FirstAidKit, class: Item do
    title "First Aid Kit"
    description 'Great for treating wounds and minor ailments'
    price 3.10
    association :supplier, factory: :supplier
  end

  factory :SchoolKit, class: Item do
    title "School Kit"
    description 'Teach school to children who have recently had their homes destroyed'
    price 3.10
    association :supplier, factory: :supplier
  end

  factory :HandSanitizer, class: Item do
    title "Hand Sanitizer"
    description 'Keep your hands clean'
    price 3.10
    association :supplier, factory: :supplier
  end



end