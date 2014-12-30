require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'


feature "menu_items things" do
  let :supplier do
    User.create(name: 'Hamburgler', email: 'hamburgler@example.com',
                password: 'p4ssw0rd', password_confirmation: 'p4ssw0rd',
                supplier_admin: true)
    # Supplier.create(name: "Torta's Supplies", email: "tortaville@mexicana.net",
    #                 phone: "303-333-3333", description: "We have a description")
  end

  before(:each) do
    visit '/login'
    fill_in 'Email', with: supplier.email
    fill_in 'Password', with: supplier.password
    click_button 'Login'
  end

  scenario "allows suppliers to view their page" do
    visit "/torta-s-supplies"
    expect(page).to have_content("Torta's Supplies")
  end

  scenario "User creates a new category" do
    visit "/torta-s-supplies/categories"
    new_category = "I created a category"
    expect(page.body).not_to include new_category
    click_link_or_button "New"
    fill_in "category[title]", with: new_category
    click_link_or_button "Create Category"
    expect(page.body).to include new_category
  end

  scenario "supplier creates a new item" do
    visit "/torta-s-supplies/items"
    new_item = {title: "SANDwich Bags", description: "Full of sand", price: 10000}
    expect(page.body).not_to include new_item[:title]
    click_link_or_button "New"
    fill_in "Title", with: new_item[:title]
    fill_in "Description", with: new_item[:description]
    fill_in "Price", with: new_item[:price]
    select('Flood Supplies', :from => 'category-select')
    click_link_or_button "Create Item"
    expect(page).to have_content('Item successfully created!')
    expect(page.body).to include new_item[:title]
  end

  scenario "Supplier can delete a category" do
    new_category = "I created a category"
    Category.create(title: new_category)

    visit "/torta-s-supplies/categories"
    expect(page.body).to include new_category
    click_link_or_button "Title: #{new_category}"
    click_link_or_button "Delete"

    expect(page.body).not_to include new_category
  end

  scenario "Supplier can edit a category" do
    new_category = "I created a category"
    Category.create(title: new_category)

    visit "/torta-s-supplies/categories"
    expect(page.body).to include new_category
    click_link_or_button "Title: #{new_category}"
    click_link_or_button "Edit"

    fill_in "category[title]", with: "I edited a category"
    click_link_or_button "Update Category"
    expect(page.body).to include "I edited a category"
    expect(page.body).not_to include new_category
  end
end
