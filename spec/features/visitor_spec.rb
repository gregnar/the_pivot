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
    lechuga.save!(validate: false)
    hoop.save!(validate: false)

    torta_shop.save!(validate: false)
    torta_shop.items << lechuga
    nba_cares.save!(validate: false)
    nba_cares.items << hoop
  end

  context "when visitor visits a business" do

    it "has list of all suppliers" do
      visit suppliers_path
      expect(page).to have_content("Torta's Supplies")
    end

  end
end
