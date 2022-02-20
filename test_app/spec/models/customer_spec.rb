require 'rails_helper'

RSpec.describe Customer, type: :model do

  fixtures :customers

  it 'Create a customer' do
    subject.name = 'Jackson Pires'
    subject.email = 'jackson@pires.com'
    subject.save

    expect(subject.full_name).to eq('Sr. Jackson Pires')
  end
 
  it 'Create a customer(fixtures)' do
    customer = customers(:jackson)

    expect(customer.full_name).to eq('Sr. Jackson Pires')
  end

  it 'Create a customer(factory)' do
    customer = create(:customer)

    expect(customer.full_name).to eq('Sr. Jackson Pires')
  end
end
