require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'Unauthenticated visitor happy path', type: :feature do

  around(:each) do |example|
    DatabaseCleaner.start
    example.run
    DatabaseCleaner.clean
  end

  let(:torta_shop) { FactoryGirl.build(:torta_shop) }
  let(:lechuga) { FactoryGirl.build(:lechuga) }
  let(:nba_cares) { FactoryGirl.build(:nba_cares) }
  let(:hoop) { FactoryGirl.build(:hoop) }

  before do
    lechuga.categories << FactoryGirl.build(:category)
    hoop.categories << FactoryGirl.build(:category)
    lechuga.save!(validation: false)
    hoop.save!(validation: false)
    torta_shop.save!(validation: false)
    torta_shop.items << lechuga
    nba_cares.save!(validation: false)
    nba_cares.items << hoop
  end

  context "when visitor visits a business" do

    it "has list of all suppliers" do
      binding.pry
      visit suppliers_path
      expect(page).to have_content("Torta's Supplies")
    end

    xit "goes to the correct page" do
      click_link_or_button "Torta's Supplies"
      expect(current_path).to eq(torta_path.slug)
      expect(page).to have_content("Torta's Supplies")
    end
  end

  context "when visitor shops" do

    xit "adds supplies from various suppliers into shared cart" do
      visit supplier_item_path(hoop)
      click_link_or_button "Add To Cart"
      visit supplier_item_path(lechuga)
      click_link_or_button "Add To Cart"

      visit cart_items_path
      expect(page).to have_content(lechuga.title)
      expect(page).to have_content(hoop.title)
      expect(page).to have_content(torta_shop.name)
      expect(page).to have_content(nba_cares.name)
    end

    xit "can browse all supplies from all suppliers" do
      visit root_path
      click_link_or_button "Browse Supplies"

      expect(current_path).to   eq(items_path)
      expect(page).to           have_content(lechuga.title)
      expect(current_path).to   have_content(hoop.title)
    end
  end
end
