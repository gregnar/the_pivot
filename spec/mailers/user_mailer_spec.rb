require "rails_helper"
require 'capybara/rails'
require 'capybara/rspec'

RSpec.describe UserMailer, :type => :feature do

  before(:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
  end

  after(:each) do
    ActionMailer::Base.deliveries.clear
  end

  context ".confirmation_email" do
    let(:user) { FactoryGirl.create(:user) }
    let(:delivered_emails) { ActionMailer::Base.deliveries }

    before(:each) do
      visit root_path
      click_link 'Sign Up'
      fill_in 'Name', with: 'Name'
      fill_in 'Email', with: 'email@email.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_link_or_button 'Submit'
    end

    xit "sends the email" do
      expect(delivered_emails.count).to eq(1)
    end

    xit 'renders the receiver email' do
      delivered_emails.first.to.should eq("email@email.com")
    end

    xit 'should set the subject to the correct subject' do
      delivered_emails.first.subject.should include("Verify")
    end

    xit 'renders the sender email' do
      delivered_emails.first.from.should eq(['reliefbot@airlift.com'])
    end
  end

end
