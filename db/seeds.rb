require "#{Rails.root}/db/item_seeds.rb"
require "#{Rails.root}/db/category_seeds.rb"
class Seed

  def initialize
    User.destroy_all
    Category.destroy_all
    Supplier.destroy_all
    Item.destroy_all
    Order.destroy_all
    Address.destroy_all

    @big_shots = []
    @image_path = Rails.root.join("app", "assets", "images", "items")


    generate_users #users must come before customers!
    generate_customers
    generate_addresses
    generate_suppliers
    generate_items
    generate_coordinates
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
      items = ItemSeeds.all_items
      20.times do |i|
        puts "Generating item #{i} for supplier #{supplier.id}..."
        title_alias     = items.pop
        item            = ItemSeeds.new_item(title_alias)
        item.categories << Category.find_by(name: items_with_categories(title_alias), supplier_id: supplier.id)
        item.supplier   = supplier
        item.photo = File.open(@image_path.join("#{item.title.parameterize}.jpg"))
        item.save!
      end
    end
  end

  def generate_orders
    all_suppliers = Supplier.all
    all_suppliers.each do |supplier|
      5.times do 
        order = Order.new
        order.items << Item.where(supplier_id: supplier.id).sample(3)
        order.pending = [true, false].sample
        order.user_id = User.all.map(&:id).sample
        order.coordinate_id = Coordinate.all.sample.id
        order.save!
        puts "Added #{order.id} for #{order.user.name}"
      end
    end
  end

  def generate_suppliers
    possible_admins = User.all.shuffle
    all_suppliers.map do |supplier_name, description|
      supplier_email = "Airlift@#{supplier_name.gsub(/\W+/, "").downcase}.com"
      s = Supplier.new(     name: supplier_name,
                            email: supplier_email,
                            phone: Faker::PhoneNumber.phone_number,
                            fax: Faker::PhoneNumber.phone_number,
                            description: description,
                            slug: Faker::Company.name,
                            address_id: (Address.all.sample.id)
                          )

      s.users << possible_admins.pop
      @big_shots.map { |big_shot| s.users << big_shot unless big_shot.supplier_admin? }

      CategorySeeds.all_categories.map do |category|
        CategorySeeds.create_category(category)
        s.categories << Category.last
      end

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

  def all_suppliers
    {
      'The Emergency Warehouse'        => 'Located in Tampa Bay, FL. Providing relief supplies since 1986.',
      'Relief Wholesale, LLC'          => 'Always in stock, always high quality.',
      'Johnson Disaster Response'      => 'The most trusted name in disaster suppliers since 1990.',
      'Garrison Bulk Relief'           => 'Sole supplier for Catholic Relief Services since 1978. Find out why today!',
      'Akron Disaster Supply'          => 'The largest relief supply in the Great Lakes region.',
      'Chicago Aid and Relief'         => 'AIRLIFT Vendor Awards Honorable Mention, 2005.',
      'Wal-Mart Disaster Aid Services' => 'Wal-Mart business sense, when you need it most.',
      'Kennedy and Simpson, Inc'       => 'Since 1959. Lowest prices, guaranteed.',
      'The Disaster Company'           => 'Newest AIRLIFT supplier. Bringing AGILE strategies to disaster relief.',
      'Whitman Emergency Services'     => 'The largest emergency supplies vendor in the country, period.'
    }
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

  def generate_coordinates
    bad_variable = (10_000_000..99_999_999).to_a.sample/1000000.0
    10.times do 
      Coordinate.create!(latitude: bad_variable, longitude: bad_variable)
    end
  end

end

Seed.new
