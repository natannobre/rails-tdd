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

    it 'with invalid attributes' do
      customer_params = attributes_for(:customer, address: nil)
      sign_in @member

      expect {
        post :create, params: { customer: customer_params }
      }.not_to change(Customer, :count)
    end

    it 'Flash Notice' do 
      customer_params = attributes_for(:customer)
      sign_in @member
      post :create, params: { customer: customer_params }
      expect(flash[:notice]).to match(/successfully created/)
    end

    it 'Content-Type JSON' do
      customer_params = attributes_for(:customer)
      sign_in @member
      post :create, format: :json, params: { customer: customer_params }
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end

    it 'Route' do
      is_expected.to route(:get, '/customers').to(action: :index)
    end
  end
end