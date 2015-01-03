class Seed
  def initialize
    User.destroy_all
    Category.destroy_all
    Supplier.destroy_all
    Item.destroy_all
    Order.destroy_all
    Address.destroy_all
    @big_shots = []

    generate_users #users must come before customers!
    generate_customers
    generate_addresses
    generate_suppliers
    generate_items
    generate_orders
  end

  def generate_users
    puts 'Adding users 1 through 4'
    User.create(name: 'Rachel Warbelow',
                email: 'demo+rachel@jumpstartlab.com',
                password: 'password',
                password_confirmation: 'password',
                display_name: 'Rachel Warbelow',
                admin: false
                )

    User.create(name: 'Jeff',
                email: 'demo+jeff@jumpstartlab.com',
                password: 'password',
                password_confirmation: 'password',
                display_name: 'j3',
                admin: false)

    User.create(name: 'Jorge Tellez',
                email: 'demo+jorge@jumpstartlab.com',
                password: 'password',
                password_confirmation: 'password',
                display_name: 'novohispano',
                admin: true)

    User.create(name: 'Josh Cheek',
                email: 'demo+josh@jumpstartlab.com',
                password: 'password',
                password_confirmation: 'password',
                display_name: 'josh',
                admin: true)

    User.last(4).map { |user| @big_shots << user }
  end

  def generate_addresses
    4.times do |i|
      Address.create!(
        street_number: Faker::Address.building_number,
        street_name: Faker::Address.street_name,
        city: Faker::Address.city,
        state: Faker::Address.state_abbr,
        zip_code: Faker::Address.zip,
        user_id: i + 1,
        supplier_id: i + 1
        )
      puts "Added address for user #{i + 1}"
    end
  end

  def generate_items
    puts "Generating 20 items per business..."
    suppliers = Supplier.all
    suppliers.each do |supplier|
      items = all_items.dup.shuffle
      20.times do |i|
        puts "Generating item #{i} for supplier #{supplier.id}..."
        title_alias     = items.pop
        item            = FactoryGirl.build(title_alias)
        item.categories << Category.find_by(name: items_with_categories(title_alias), supplier_id: supplier.id)
        item.supplier   = supplier
        add_photo_to_item(item)
        item.save!
      end
    end
  end

  def add_photo_to_item(item)
    image_path = Rails.root.join("app", "assets", "images", "items")
    item.photo = File.open(image_path.join("#{item.title.parameterize}.jpg"))
  end

  def generate_orders
    10.times do |i|
      order = Order.new(user_id: rand(4))
      order.id = i
      order.delivery = false
      order.items = Item.all.sample(rand(10))
      order.pending = [true, false].sample
      order.user_id = User.all.map(&:id).sample
      order.save!
      puts "Added #{order.id} for #{order.user.name}"
    end
  end

  def generate_suppliers
    10.times do |i|
      s = Supplier.create!( name: Faker::Name.name,
                            email: Faker::Internet.email,
                            phone: Faker::PhoneNumber.phone_number,
                            fax: Faker::PhoneNumber.phone_number,
                            description: "This is the greatest business to ever exist.  We help people!
                                          We help people!  No more secrets and no more lies!",
                            slug: Faker::Company.name,
                            address_id: (i + 1)
                          )
      possible_admins = User.all.shuffle

      s.users << possible_admins.pop
      @big_shots.map { |big_shot| s.users << big_shot unless big_shot.supplier_admin? }


      all_categories.map { |category| s.categories << FactoryGirl.create(category) }
      s.save!
    end
  end

  def generate_customers
    100.times do |i|
      name = Faker::Name.name
      User.create!( name: name,
                    email: Faker::Internet.email,
                    password: 'password',
                    password_confirmation: 'password',
                    display_name: name,
                    admin: false,
                  )
    end
  end

  private

  def all_categories
    [:medical,
     :food_and_water,
     :energy_and_heat,
     :childcare,
     :clothing,
     :flood_relief,
     :tools,
     :shelter_bedding
     ]
  end

  def all_items
    [ :potable_water,
      :sand_bags,
      :emergency_meals,
      :bulk_rice,
      :flashlight,
      :penicillin,
      :birthing_kit,
      :bedding_kit,
      :baby_formula,
      :UtilityKnife,
      :Diapers,
      :FireStarterKit,
      :WaterFiltration,
      :WaterStorageTank,
      :Hatchet,
      :Batteries,
      :PowderedMilk,
      :BulkSalt,
      :BulkSugar,
      :BulkFlour,
      :BulkCannedBeans,
      :Boots,
      :Iodine,
      :DisasterTent,
      :SleepingBag,
      :DuctTape,
      :Gauze,
      :PortableHeater,
      :PropaneTank,
      :Poncho,
      :WorkGloves,
      :Generator,
      :InflatableRaft,
      :TetanusShots,
      :FirstAidKit,
      :SchoolKit,
      :HandSanitizer
    ]
  end

  def items_with_categories(item)
    { potable_water: 'Food and Water',
      WaterStorageTank: 'Food and Water',
      bulk_rice: 'Food and Water',
      emergency_meals: 'Food and Water',
      sand_bags: 'Flood Relief',
      flashlight: 'Tools',
      penicillin: 'Medical and Hygiene',
      birthing_kit: 'Childcare',
      bedding_kit: 'Shelter and Bedding',
      baby_formula: 'Childcare',
      UtilityKnife: 'Tools',
      Diapers: 'Childcare',
      FireStarterKit: 'Energy and Heat',
      WaterFiltration: 'Medical and Hygiene',
      Hatchet: 'Tools',
      Batteries: 'Energy and Heat',
      PowderedMilk: 'Food and Water',
      BulkSalt: 'Food and Water',
      BulkSugar: 'Food and Water',
      BulkFlour: 'Food and Water',
      BulkCannedBeans: 'Food and Water',
      Boots: 'Clothing',
      Iodine: 'Medical and Hygiene',
      DisasterTent: 'Shelter and Bedding',
      SleepingBag: 'Shelter and Bedding',
      DuctTape: 'Tools',
      Gauze: 'Medical and Hygiene',
      PortableHeater: 'Energy and Heat',
      PropaneTank: 'Energy and Heat',
      Poncho: 'Clothing',
      WorkGloves: 'Clothing',
      Generator: 'Energy and Heat',
      InflatableRaft: 'Flood Relief',
      TetanusShots: 'Medical and Hygiene',
      FirstAidKit: 'Medical and Hygiene',
      SchoolKit: 'Childcare',
      HandSanitizer: 'Medical and Hygiene'
    }.fetch(item)
  end




end

Seed.new
