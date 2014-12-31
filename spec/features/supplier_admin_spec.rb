require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'


describe 'Supplier admin path', type: :feature do
  around(:each) do |example|
    DatabaseCleaner.start
    example.run
    DatabaseCleaner.clean
  end

  context 'when logged in as supplier_admin' do
    let(:supplier_admin) { FactoryGirl.create(:supplier_admin) }
    let(:supplier) { FactoryGirl.create(:supplier) }
    let(:item)  { FactoryGirl.build(:item) }
    let(:category) { FactoryGirl.create(:category) }
    let(:user) {FactoryGirl.create(:user)}

    before(:each) do
      user.supplier = supplier
      supplier.users << user
      supplier.categories << category

      visit '/login'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Login'
    end

    it "allows suppliers to view their page" do
      visit supplier_items_path(slug: supplier.slug)
      expect(page).to have_content("Red Cross")
    end

    xit "allows supplier_admins to create new categories" do
      visit new_supplier_category_path(slug: supplier.slug)
      new_category = "I created a category"
      expect(page.body).not_to include new_category
      click_link_or_button "New"
      fill_in "category[title]", with: new_category
      click_link_or_button "Create Category"
      expect(page.body).to include new_category
    end

    xit "allows supplier_admins to delete a category" do
      new_category = "I created a category"
      Category.create(title: new_category)

      visit "/torta-s-supplies/categories"
      expect(page.body).to include new_category
      click_link_or_button "Title: #{new_category}"
      click_link_or_button "Delete"

      expect(page.body).not_to include new_category
    end

    xit "allows supplier_admins to edit a category" do
      new_category = "I created a category"
      Category.create(name: new_category)

      visit "/torta-s-supplies/categories"
      expect(page.body).to include new_category
      click_link_or_button "Title: #{new_category}"
      click_link_or_button "Edit"

      fill_in "Name", with: "I edited a category"
      click_link_or_button "Update Category"
      expect(page.body).to include "I edited a category"
      expect(page.body).not_to include new_category
    end

    # xit "allows supplier_admins to create new items" do
    #   visit new_supplier_items_path(slug: supplier.slug)
    #   new_item = {title: "SANDwich Bags", description: "Full of sand", price: 10000}
    #   expect(page.body).not_to include new_item[:title]
    #   click_link_or_button "New"
    #   fill_in "Title", with: new_item[:title]
    #   fill_in "Description", with: new_item[:description]
    #   fill_in "Price", with: new_item[:price]
    #   select('Flood Supplies', :from => 'category-select')
    #   click_link_or_button "Create Item"
    #   expect(page).to have_content('Item successfully created!')
    #   expect(page.body).to include new_item[:title]
    # end
  end
end
