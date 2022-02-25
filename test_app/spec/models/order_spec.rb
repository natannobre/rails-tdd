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

  it 'create 2 orders - create_pair' do
    orders = create_pair(:order)
    expect(orders.count).to eq(2)
  end

  it 'has 3 orders - create_list' do
    orders = create_list(:order, 3, description: 'teste')
    expect(orders.count).to eq(3)
  end

  it 'has many' do
    customer = create(:customer, :with_orders, qtt_order: 5)
    expect(customer.orders.count).to eq(5)
  end
end
