module ItemSeeds

  def self.new_item(item)
    Item.new(all_attributes[item])
  end

  def self.all_items
    all_attributes.keys.dup
  end

  def self.all_attributes
    {
       :potable_water => {
        title: 'Potable water',
        description: '20 gallon weather-proof container.',
        price: 12.50
      },

       :sand_bags => {
        title: 'Sand Bags',
        description: '40lbs each. Build barriers during natural disasters.',
        price: 15.99
      },

       :emergency_meals => {
        title: 'R&H Brand Emergecy Meal Kit',
        description: "32 servings per kit, one meal per serving. Includes Salisbury Steak, Lasagna, Shephard's Pie, and Pork Chop dinners.",
        price: 95.99
      },

       :bulk_rice => {
        title: 'Bulk Rice',
        description: '20 lbs each. Jasmine rice. Non-perishable.',
        price: 10.95
      },

       :flashlight => {
        title: 'Killarney Brand Flashlight',
        description: 'Extra long battery life. Waterproof.',
        price: 25.99
      },

       :penicillin => {
        title: 'Penicillin',
        description: 'Emergency Penicillin supply from Bayer. 50 capsules per bottle.',
        price: 75.59
      },

       :birthing_kit => {
        title: 'Birthing Kit',
        description: 'Emergency Birthing Kit. Includes baby formula.',
        price: 50.02
      },

       :bedding_kit => {
        title: 'Bedding Kit',
        description: 'Emergency Bedding Kit. Includes cot, sleeping pad, blanket and pillow',
        price: 68.04
      },

       :baby_formula => {
        title: 'Baby Formula',
        description: 'Powdered formula. 5 lbs.',
        price: 42.38
      },

       :UtilityKnife => {
        title: "Utility Knife",
        description: 'This knife is excellent for cutting utilities.',
        price: 18.99
      },

       :Diapers => {
        title: "Diapers",
        description: 'Diapers for diapering infants.  25 count.',
        price: 59.99
      },

       :FireStarterKit => {
        title: "Fire Starter Kit",
        description: "With no electricity, you will need to start fires.  You're welcome.",
        price: 229.99
      },

       :WaterFiltration => {
        title: "Water Filtration",
        description: 'Make your water clean.',
        price: 74.99
      },

       :WaterStorageTank => {
        title: "Water Storage Tank",
        description: 'Store your water.',
        price: 199.99
      },

       :Hatchet => {
        title: "Hatchet",
        description: 'Defend yourself from bandits.',
        price: 39.99
      },

       :Batteries => {
        title: "Batteries",
        description: 'Batteries to power your appliances.  8 count.',
        price: 299.99
      },

       :PowderedMilk => {
        title: "Powdered Milk",
        description: 'Delicious quality milk in powder form, just add water.',
        price: 19.99
      },

       :BulkSalt => {
        title: "Bulk Salt",
        description: 'Large amounts of salt to preserve you food.',
        price: 19.99
      },

       :BulkSugar => {
        title: "Bulk Sugar",
        description: 'Your going to want to put some sugar on the foul stuff you will be eating.',
        price: 29.99
      },

       :BulkFlour => {
        title: "Bulk Flour",
        description: 'In case you want to bake tens of thousands of loaves of bread.',
        price: 29.99
      },

       :BulkCannedBeans => {
        title: "Bulk Canned Beans",
        description: "Beans:  It's whats for dinner.",
        price: 14.99
      },

       :Boots => {
        title: "Boots",
        description: 'Great for trudging through a wasteland of destruction.',
        price: 79.99
      },

       :Iodine => {
        title: "Iodine",
        description: 'Use it to clean water and wounds.',
        price: 19.99
      },

       :DisasterTent => {
        title: "Disaster Tent",
        description: 'You want to sleep in the rain?  No?  Then you MUST buy this tent.',
        price: 159.99
      },

       :SleepingBag => {
        title: "Needles",
        description: 'You want to sleep on the dirt?  No?  Then you MUST buy this sleeping bag.',
        price: 59.99
      },

       :DuctTape => {
        title: "Duct Tape",
        description: 'Great for taping things together.',
        price: 8.99
      },

       :Gauze => {
        title: "Gauze",
        description: 'Bandage wounds.',
        price: 9.99
      },

       :PortableHeater => {
        title: "Portable Heater",
        description: 'Heat your disaster tent.',
        price: 149.99
      },

       :PropaneTank => {
        title: "Propane Tank",
        description: 'This tank will let you cook stuff.',
        price: 99.99
      },

       :Poncho => {
        title: "Poncho",
        description: 'This poncho will keep you dry in the rain.',
        price: 69.99
      },

       :WorkGloves => {
        title: "Work Gloves",
        description: 'These gloves will keep your hands from getting cut to shreds.',
        price: 17.99
      },

       :Generator => {
        title: "Generator",
        description: 'Use this so you will have electricity.',
        price: 349.99
      },

       :InflatableRaft => {
        title: "Inflatable Raft",
        description: 'Unless you want to swim around to rescue people, you need this raft.',
        price: 179.99
      },

       :TetanusShots => {
        title: "Tetanus Shots",
        description: 'Guaranteed to keep you tetanus free.  3 count.',
        price: 749.99
      },

       :FirstAidKit => {
        title: "First Aid Kit",
        description: 'Great for treating wounds and minor ailments.',
        price: 89.99
      },

       :SchoolKit => {
        title: "School Kit",
        description: 'Teach school to children who have recently had their homes destroyed.',
        price: 129.99
      },

       :HandSanitizer => {
        title: "Hand Sanitizer",
        description: 'Keep your hands clean.',
        price: 24.99
      }
    }
  end
end
