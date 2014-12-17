require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'Unauthenticated visitor happy path', type: :feature do

  context "when visitor visits a business" do
    let(:torta_shop) do
      Supplier.create(name: "Torta's Supplies",
              email:        "tortaville@mexicana.net",
              phone:        "1-(720)-303-6098",
              fax:          "1-(720)-946-7839",
              description:  "We are a super-special service for airdropped mexican sandwiches.
                            They raise morale and promote Jorge's happiness!"
      )
    end

    visit suppliers_path
    expect(page).to have_content("Torta's Supplies")

    click_link_or_button "Torta's Supplies"
    expect(current_path).to eq(torta_path.slug)
    expect(page).to have_content("Torta's Supplies")
  end
end
