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

    expect(customer.full_name).to start_with('Sr. ')
  end

  it { expect { create(:customer) }.to change { Customer.all.size }.by(1) }

  it '#full_name - specify attribute' do
    customer = create(:user, name: 'Jackson Pires') # factory alias

    expect(customer.full_name).to start_with('Sr. ')
  end
end
