require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  context 'as a Guest' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end

    it 'has a 302 status code (not authorized)' do
      create(:customer)
      get :show, params: { id: Customer.last.id }
      expect(response.status).not_to eq(200)
    end
  end

  context 'as Logged Member' do

    before do
      @member = create(:member)
      @customer = create(:customer)
    end
    
    it '#show' do
      sign_in @member

      get :show, params: { id: Customer.last.id }
      expect(response.status).to eq(200)
    end

    it 'render a :show template' do
      sign_in @member

      get :show, params: { id: Customer.last.id }
      expect(response).to render_template(:show)
    end

    it 'with valid attributes' do
      customer_params = attributes_for(:customer)
      sign_in @member

      expect {
        post :create, params: { customer: customer_params }
      }.to change(Customer, :count).by(1)
    end

    it 'Flash Notice' do 
      customer_params = attributes_for(:customer)
      sign_in @member
      post :create, params: { customer: customer_params }
      expect(flash[:notice]).to match(/successfully created/)
    end
  end
end