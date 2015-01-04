require 'rails_helper'

RSpec.describe Category, :type => :model do
  let(:category) { FactoryGirl.build(:category) }
  let(:item) { FactoryGirl.build(:item) }

  before do
    item.categories << category
    item.save!
    category.save!
  end

  it 'is valid' do
    expect(category).to be_valid
  end

  it 'is invalid without a name' do
    category.name = nil
    expect(category).to be_invalid
  end

  it 'associates with a collection of items' do
    expect(category.items.count).to eq(1)
  end

end
