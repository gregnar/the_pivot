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
    let(:confirmation_email) { UserMailer.confirmation_email(user) }

    before(:each) do
      confirmation_email.deliver
    end

    after(:each) do
      delivered_emails.clear
    end

    it "sends the email" do
      expect(delivered_emails.count).to eq(1)
    end

    it 'renders the receiver email' do
      delivered_emails.first.to.should eq([user.email])
    end

    it 'should set the subject to the correct subject' do
      delivered_emails.first.subject.should include("Verify")
    end

    it 'renders the sender email' do
      expect(delivered_emails.first.from.first).to include('reliefbot')
    end
  end

end
