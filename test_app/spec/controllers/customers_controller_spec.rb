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
    it '#show' do
      member = create(:member)
      create(:customer)

      sign_in member

      get :show, params: { id: Customer.last.id }
      expect(response.status).to eq(200)
    end

    it 'render a :show template' do
      member = create(:member)
      create(:customer)

      sign_in member

      get :show, params: { id: Customer.last.id }
      expect(response).to render_template(:show)
    end

    it 'with valid attributes' do
      customer_params = attributes_for(:customer)
      p customer_params
    end
  end
end