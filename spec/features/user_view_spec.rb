require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'
require 'pry'

describe 'the user view for supplier', type: :feature do
  let(:user_supplier) { FactoryGirl.create(:user_supplier) }



  it "shows the user data" do 
    visit root_path
    click_link 'Login'
    fill_in 'Email', with: user_supplier.email
    fill_in 'Password', with: user_supplier.password
    click_button 'Login'
    expect(page).to have_content("Slug")
    expect(page).to have_content("Phone")
  end
end
