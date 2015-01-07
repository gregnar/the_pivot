require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'Registering new suppliers and users', type: :feature do

  around(:each) do |example|
    DatabaseCleaner.start
    example.run
    DatabaseCleaner.clean
  end

  let(:user_attributes) {
    { name: "Brad",
      display_name: "Bradley",
      email: "bradrules@georgia.edu",
      password: "password",
      password_digest: "password"
    }
  }
  let(:supplier_attributes) {
    { name: "Brad's supplies",
      email: "bradstuff@brad.net",
      phone: "2037109694",
      description: "I'm Brad and I help people.",
      address_id: 1
    }
  }

  context "as an unauthenticated user" do

    before(:each) do
      visit root_path
      click_link "Register Supplier"
    end

    it "redirects to new user path with supplier param" do
      expect(current_path).to eq(new_user_path)
      expect(page).to have_content('Start by making a normal user account')
    end

    it "creates a user and redirects to the new supplier form" do
      expect(page).to have_css('input#user_password')
      expect(page).to have_css('input#user_password_confirmation')
      fill_in 'user_name', with: user_attributes[:name]
      fill_in 'Display name', with: user_attributes[:display_name]
      fill_in 'user_email', with: user_attributes[:email]
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      click_button 'Submit'
      expect(current_path).to eq(new_supplier_path)
    end

  end

end
