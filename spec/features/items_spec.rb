require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'Item Manipulation', type: :feature do
  around(:each) do |example|
    DatabaseCleaner.start
    example.run
    DatabaseCleaner.clean
  end

  context 'as an unauthenticated user' do
    let(:item) { FactoryGirl.build(:item) }
    let(:category) { FactoryGirl.build(:category) }
    let(:supplier) { FactoryGirl.create(:supplier) }

    before do
      category.save!(validate: false)
      item.categories << category
      item.save!
    end

    it 'can view a single item' do
      visit supplier_items_path(slug: supplier.slug)
      click_link item.title
      expect(page).to have_content 'Sand Bags'
      expect(page).to have_content '2.99'
    end

  end

  context 'when logged in as an admin' do
    let(:admin) { FactoryGirl.create(:admin) }
    let(:item)  { FactoryGirl.build(:item) }
    let(:category) { FactoryGirl.create(:category) }
    let(:supplier) { FactoryGirl.create(:supplier) }
    let(:user) {FactoryGirl.create(:user)}

    before(:each) do
      user.supplier = supplier
      supplier.users << user
      supplier.categories <<  category

      visit login_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Login'
    end

    it 'can add a new item' do
      visit new_supplier_item_path(slug: supplier.slug)
      fill_in 'Title', with: 'Coffee'
      fill_in 'Description', with: 'Black gold'
      fill_in 'Price', with: 2.99
      select(category.name, :from => 'category-select')
      click_button 'Submit'

      expect(page).to have_content('Item successfully created!')
    end

    it 'can edit an existing item' do
      item.categories << category
      item.save
      supplier.items << item
      visit supplier_items_path(slug: supplier.slug)
      save_and_open_page
      click_link 'Edit'
      expect(current_path).to eq(edit_item_path(item))
    end
  end
end
