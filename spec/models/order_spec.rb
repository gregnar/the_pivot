require 'rails_helper'

RSpec.describe Order, :type => :model do

  let(:order) do
    Order.new(pending: false)
  end

  let(:supplier) { FactoryGirl.create(:supplier) }
  let(:supplier2) { FactoryGirl.create(:supplier2) }
  let(:item) { FactoryGirl.build(:item) }
  let(:item2) { FactoryGirl.build(:item2) }

  xit 'is valid' do
    expect(order).to be_valid
  end

  xit 'is invalid without a delivery status' do
    order.delivery = nil
    expect(order).to_not be_valid
  end

  xit 'is invalid without pending status' do
    order.pending = nil
    expect(order).to_not be_valid
  end

  xit 'is invalid if delivery is true but no address selected' do
    order.address = nil
    expect(order).to_not be_valid
  end

  xit 'is valid if delivery is false and no address entered' do
    order.address = nil
    order.delivery = false
    expect(order).to be_valid
  end

  context "cancelling for only a supplier" do
    before do
      item.save!(validate: false)
      item2.save!(validate: false)
      supplier.items << item
      supplier2.items << item2
      order.items << item
      order.items << item2
      order.save!(validate: false)
    end

    it 'only removes items for one supplier' do
      expect(order.items.count).to eq(2)
      order.cancel_supplier_items(supplier)
      expect(order.items.count).to eq(1)
    end
  end

end
