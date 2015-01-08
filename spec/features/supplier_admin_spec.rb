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
    let(:supplier_admin) { FactoryGirl.build(:user_supplier) }
    let(:supplier) { FactoryGirl.build(:supplier) }
    let(:item)  { FactoryGirl.build(:item) }
    let(:category) { FactoryGirl.build(:category) }
    let(:user) {FactoryGirl.create(:user)}

    before(:each) do
      supplier_admin.supplier = supplier
      supplier.users << user
      supplier.categories << category
      supplier.save!
      supplier_admin.save!

      visit '/login'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Login'
    end

    it "allows suppliers to view their page" do
      visit supplier_items_path(slug: supplier.slug)
      expect(page).to have_content("Red Cross")
    end

    it "allows supplier_admins to create new categories" do
      visit new_supplier_category_path(slug: supplier.slug)
      new_category = "I created a category"
      fill_in "Name", with: new_category
      click_link_or_button "Submit"
      expect(page.body).to include new_category
    end
  end

end
