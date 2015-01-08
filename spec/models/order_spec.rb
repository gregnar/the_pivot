require 'rails_helper'

RSpec.describe Order, :type => :model do

  let(:order) do
    Order.new(pending: false)
  end

  let(:supplier) { FactoryGirl.create(:supplier) }
  let(:supplier2) { FactoryGirl.create(:supplier2) }
  let(:item) { FactoryGirl.build(:item) }
  let(:item2) { FactoryGirl.build(:item2) }

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
