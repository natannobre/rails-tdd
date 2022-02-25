require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'has a Customer' do
    order = create(:order)
    expect(order.customer).to be_kind_of(Customer)
  end

  it 'pass parameter Customer' do
    customer = create(:customer)
    order = create(:order, customer: customer)
    expect(order.customer).to be_kind_of(Customer)
  end

  it 'has 3 orders' do
    orders = create_list(:order, 3, description: 'teste')
    expect(orders.count).to eq(3)
  end
end
