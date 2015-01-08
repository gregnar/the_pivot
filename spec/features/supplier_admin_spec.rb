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

  end

end
