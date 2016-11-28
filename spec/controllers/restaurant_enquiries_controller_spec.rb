require 'rails_helper'

RSpec.describe RestaurantEnquiriesController, type: :controller do
  let(:restaurant) { create(:restaurant) }

  let(:valid_attributes) { attributes_for(:restaurant_enquiry) }

  let(:invalid_attributes) { { restaurant_enquiry: {} } }

  let(:valid_session) { {} }

  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET #new' do
    it 'assigns a new restaurant_enquiry as @restaurant_enquiry' do
      get :new, { restaurant_id: restaurant.id }, valid_session
      expect(assigns(:restaurant_enquiry)).to be_a_new(RestaurantEnquiry)
    end

    describe 'POST #create' do
      context 'with valid params' do
        it 'creates a new RestauranEnquiry' do
          expect do
            post :create, { restaurant_id: restaurant.id,
                            restaurant_enquiry: valid_attributes }, valid_session
          end.to change(RestaurantEnquiry, :count).by(1)
        end

        it 'assigns a newly created RestaurantEnquiry to user' do
          post :create, { restaurant_id: restaurant.id,
                          restaurant_enquiry: valid_attributes }, valid_session
          expect(RestaurantEnquiry.last.user).to eq user
        end

        it 'assigns a newly created restaurant_enquiry as @restaurant_enquiry' do
          post :create, { restaurant_id: restaurant.id,
                          restaurant_enquiry: valid_attributes }, valid_session
          expect(assigns(:restaurant_enquiry)).to be_a(RestaurantEnquiry)
          expect(assigns(:restaurant_enquiry)).to be_persisted
        end

        it 'redirects to the created restaurant_enquiry' do
          post :create, { restaurant_id: restaurant.id,
                          restaurant_enquiry: valid_attributes }, valid_session
          expect(response).to redirect_to(restaurant_path(restaurant))
        end
      end

      context 'with invalid params' do
        it 'assigns a newly created but unsaved restaurant_enquiry as @restaurant_enquiry' do
          post :create, { restaurant_id: restaurant.id,
                          restaurant_enquiry: invalid_attributes }, valid_session
          expect(assigns(:restaurant_enquiry)).to be_a_new(RestaurantEnquiry)
        end

        it 're-renders the "new" template' do
          post :create, { restaurant_id: restaurant.id,
                          restaurant_enquiry: invalid_attributes }, valid_session
          expect(response).to render_template('new')
        end
      end
    end
  end
end
