require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'the addresses view', type: :feature do
  let(:admin) { FactoryGirl.create(:admin) }


  let(:addresses) { [Address.create(street_name: "Bad Street", street_number: "8000",
                                  city: "Beverly Hills", state: "CA", zip_code: "90210",
                                  user_id: admin.id),
                    Address.create(street_name: "Good Street", street_number: "8000",
                                  city: "Beverly Hills", state: "CA", zip_code: "90210",
                                  user_id: admin.id)]
                                   }


  before(:each) do
    visit root_path
    click_link 'Login'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Login'
  end

  it "shows the addresses" do
    expect(page).to have_content('Addresses')
  end

  xit "adds a new address" do
    click_link_or_button("User")
    page.click_link_or_button("Add Address")
    page.fill_in(:street_number, with: "10000")
    page.fill_in(:street_name, with: "1000")
    page.fill_in("City", with: "Philadelphia")
    page.fill_in("State", with: "PA")
    page.fill_in("Zip code", with: "19089")
    page.click_button("Submit")
    expect(page).to have_content("19089")
  end
end
