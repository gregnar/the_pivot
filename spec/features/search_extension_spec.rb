require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'Search Extensions', type: :feature do

  context 'when viewing a supplier items page' do
    let(:supplier) { FactoryGirl.create(:supplier) }
    before(:each) do
      visit items_path
    end

    it 'has a search button' do
      expect(page).to have_button('Search Items')
    end
  end
end
