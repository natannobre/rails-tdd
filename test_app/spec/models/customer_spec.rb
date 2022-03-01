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
    customer = create(:customer, upcased: true)

    expect(customer.full_name).to start_with('Sr. ')
  end

  it { expect { create(:customer) }.to change { Customer.all.size }.by(1) }

  it '#full_name - specify attribute' do
    customer = create(:user, name: 'Jackson Pires') # factory alias

    expect(customer.full_name).to start_with('Sr. ')
  end

  it 'Herança #vip' do
    customer = create(:customer_vip)

    expect(customer.vip).to be true
  end

  it 'Herança #default' do
    customer = create(:customer_default)

    expect(customer.vip).to be false
  end

  it 'Usando o attributes_for' do
    attrs = attributes_for(:customer)
    customer = Customer.create(attrs)
    expect(customer.full_name).to start_with('Sr. ')
  end

  it 'Atributo Transitorio' do
    customer = create(:customer_default, upcased: true)
    expect(customer.name.upcase).to eq(customer.name)
  end

  it 'Cliente Masculino' do
    customer = create(:customer_male)
    expect(customer.gender).to eq('M')
  end

  it 'Cliente Masculino Vip' do
    customer = create(:customer_male_vip, :male)
    expect(customer.gender).to eq('M')
    expect(customer.vip).to eq(true)
  end

  it 'Cliente Feminino' do
    customer = create(:customer_female)
    expect(customer.gender).to eq('F')
  end

  it 'Cliente Feminino Vip' do
    customer = create(:customer_female_vip)
    expect(customer.gender).to eq('F')
    expect(customer.vip).to eq(true)
  end

  it 'travel_to' do
    travel_to Time.zone.local(2004, 11, 24, 01, 04, 44) do
      @customer = create(:customer_vip)
    end

    p @customer.created_at
    p Time.new(2004, 11, 24, 01, 04, 44)
    expect(@customer.created_at).to eq(Time.zone.local(2004, 11, 24, 01, 04, 44))
  end
end
