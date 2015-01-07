require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'the ADMIN page', type: :feature do
  let(:admin) { FactoryGirl.create(:admin) }

  before do
    visit root_path
  end

  context 'when logged in' do
    before do
      click_link 'Login'
      fill_in 'Email', with: admin.email
      fill_in 'Password', with: admin.password
      click_button 'Login'
    end

    describe 'ADMIN link' do
      it 'should be visible' do
        expect(page).to have_link('Admin')
      end

      it 'takes me to the ADMIN page' do
        click_link 'Admin'
        expect(page).to have_text('Admin Dashboard')
      end
    end

    describe 'ADMIN page' do
      before do
        click_link 'Admin'
      end

      it 'displays a dashboard' do
        expect(page).to have_content('Dashboard')
      end

      it 'has a link to the orders index' do
        expect(page).to have_link('Orders')
      end

      it 'has a link to the items index' do
        expect(page).to have_link('Items')
      end
    end
  end
end
