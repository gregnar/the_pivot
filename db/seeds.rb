class Seed
  def initialize
    generate_addresses
    generate_users
    generate_suppliers
    generate_categories
    generate_items
    generate_orders
    generate_customers
  end

  def generate_users
    puts 'Adding users 1 through 4'
    User.create(name: 'Rachel Warbelow',
                email: 'demo+rachel@jumpstartlab.com',
                password: 'password',
                password_confirmation: 'password',
                display_name: '',
                admin: false)

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
                admin: false)

    User.create(name: 'Josh Cheek',
                email: 'demo+josh@jumpstartlab.com',
                password: 'password',
                password_confirmation: 'password',
                display_name: 'josh',
                admin: true)
  end

  def generate_categories
    puts "Generating 5 categories..."
    5.times do |i|
      Category.create!(
        name: Faker::Commerce.department,
        supplier_id: (i + 1)
        )
    end
  end

  def generate_addresses
    4.times do |i|
      Address.create!(
        street_number: Faker::Address.building_number,
        street_name: Faker::Address.street_name,
        city: Faker::Address.city,
        state: Faker::Address.state_abbr,
        zip_code: Faker::Address.zip,
        user_id: i + 1
        )
      puts "Added address for user #{i + 1}"
    end
  end

  def generate_items
    puts "Generating 20 items per business..."
    suppliers = Supplier.all
    suppliers.each do |supplier|
      20.times do |i|
        generated_item = Item.create!(
          title: Faker::Commerce.product_name,
          description: 'A worthless thing that does not even work',
          price: Faker::Commerce.price,
          photo_file_name: nil,
          photo_content_type: 'image/png',
          photo_file_size: Faker::Number.number(3),
          photo_updated_at: Faker::Date.between(1.week.ago, Date.today),
          categories: [Category.all.sample],
          supplier_id: supplier.id,
          active: true
          )
      end
    end
  end

  def generate_orders
    10.times do |i|
      order = Order.new(user_id: rand(4))
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
      Supplier.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        phone: Faker::PhoneNumber.phone_number,
        fax: Faker::PhoneNumber.phone_number,
        description: "This is the greatest business to ever exist.  We help people!
                      We help people!  No more secrets and no more lies!",
        slug: Faker::Company.name,
        address_id: (i + 1)
        )
    end
  end

  def generate_customers
    100.times do |i|
      User.create!(name: Faker::Name.name,
                  email: Faker::Internet.email,
                  password: 'password',
                  password_confirmation: 'password',
                  display_name: '',
                  admin: false
                )
    end
  end

end

Seed.new
