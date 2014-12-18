require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'Unauthenticated visitor happy path', type: :feature do

  context "when visitor visits a business" do
    let(:torta_shop) do
      Supplier.create(name: "Torta's Supplies",
              email:        "tortaville@mexicana.net",
              phone:        "1-(720)-303-6098",
              fax:          "1-(720)-946-7839",
              description:  "We are a super-special service for airdropped mexican sandwiches.
                            They raise morale and promote Jorge's happiness!")
    end

    it "has the list of all suppliers" do
      visit '/suppliers'
      expect(page).to have_content("Torta's Supplies")
    end

    it "goes to the correct page" do
      click_link_or_button "Torta's Supplies"
      expect(current_path).to eq(torta_path.slug)
      expect(page).to have_content("Torta's Supplies")
    end
  end

  context "when visitor shops" do
    before(:all) do
      let(:torta_shop) do
        Supplier.create(name: "Torta's Supplies",
        email:        "tortaville@mexicana.net",
        phone:        "1-(720)-303-6098",
        fax:          "1-(720)-946-7839",
        description:  "We are a super-special service for airdropped mexican sandwiches. 
        They raise morale and promote Jorge's happiness!")
      end
      let(:nba_cares) do
        Supplier.create(name: "NBA Cares",
        email:        "donaldsterling@laclippers.com",
        phone:        "1-(303)-693-9048",
        fax:          "1-(720)-590-3204",
        description:  "We joined Airlyft because we believe in basketball's healing quality 
        Do you want to enrich children all over? Use NBA supplies to build high-quality courts wholewide!")
      end
      Item.create!(title: "NBA Hoop",
      description: 'Now with Shaq-proof backboards',
      price: Faker::Commerce.price,
      photo_file_name: nil,
      photo_content_type: 'image/png',
      photo_file_size: Faker::Number.number(3),
      photo_updated_at: Faker::Date.between(1.week.ago, Date.today),
      categories: [Category.all.sample],
      supplier_id: nba_cares.id,
      active: true
      )

  end
end
