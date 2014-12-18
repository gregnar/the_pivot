require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'


  feature "menu_items things" do
    let :user do
      User.create name: 'Supplying Things', email: 'supplier@example.com', password: 'p4ssw0rd', password_confirmation: 'p4ssw0rd', supplier: true
    end

    before(:each) do
      visit '/login'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Login'
    end
  end

describe 'Unauthenticated visitor happy path', type: :feature do

  context "when visitor visits a business" do
    let(:torta_shop) do
      Supplier.create(name: "Torta's Supplies",
      email:        "tortaville@mexicana.net",
      phone:        "1-(720)-303-6098",
      fax:          "1-(720)-946-7839",
      description:  "We are a super-special service for airdropped mexican sandwiches.
      They raise morale and promote Jorge's happiness!"
      )
    end
  end

  scenario "User creates a new menu_item" do
    visit "/menu_items"
    new_menu_item = {title: "I created a menu_item", description: "full of yummy", price: 10000}
    expect(page.body).not_to include new_menu_item[:title]
    click_link_or_button "New"
    fill_in "menu_item[title]", with: new_menu_item[:title]
    fill_in "menu_item[description]", with: new_menu_item[:description]
    fill_in "menu_item[price]", with: new_menu_item[:price]
    click_link_or_button "Create Menu item"
    expect(page.body).to include new_menu_item[:title]
  end

  it "allows suppliers to view their page" do

    visit "/torta-s-supplies"
    expect(page).to have_content("Torta's Supplies")

  end

  it 'can add a new item as a supplier' do
    let
    # category.save
    visit new_item_path
    fill_in 'Title', with: 'Sandwich Bags'
    fill_in 'Description', with: '20 lb Black Sandwich Bag'
    fill_in 'Price', with: 15.99
    select('Flood Supplies', :from => 'category-select')
    click_button 'Submit'

    expect(page).to have_content('Item successfully created!')
  end
end
