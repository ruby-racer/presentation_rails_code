require 'rails_helper'

RSpec.describe EventEnquiriesController, type: :controller do
  let(:event) { create(:event) }

  let(:valid_attributes) { attributes_for(:event_enquiry) }

  let(:invalid_attributes) { { event_enquiry: {} } }

  let(:valid_session) { {} }

  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET #new' do
    it 'assigns a new event_enquiry as @restaurant_enquiry' do
      get :new, { event_id: event.id }, valid_session
      expect(assigns(:event_enquiry)).to be_a_new(EventEnquiry)
    end

    describe 'POST #create' do
      context 'with valid params' do
        it 'creates a new RestauranEnquiry' do
          expect do
            post :create, { event_id: event.id, event_enquiry: valid_attributes }, valid_session
          end.to change(EventEnquiry, :count).by(1)
        end

        it 'assigns a newly created EventEnquiry to user' do
          post :create, { event_id: event.id, event_enquiry: valid_attributes }, valid_session
          expect(EventEnquiry.last.user).to eq user
        end

        it 'assigns a newly created event_enquiry as @event_enquiry' do
          post :create, { event_id: event.id, event_enquiry: valid_attributes }, valid_session
          expect(assigns(:event_enquiry)).to be_a(EventEnquiry)
          expect(assigns(:event_enquiry)).to be_persisted
        end

        it 'redirects to the created event_enquiry' do
          post :create, { event_id: event.id, event_enquiry: valid_attributes }, valid_session
          expect(response).to redirect_to(event_path(event))
        end
      end

      context 'with invalid params' do
        it 'assigns a newly created but unsaved event_enquiry as @event_enquiry' do
          post :create, { event_id: event.id, event_enquiry: invalid_attributes }, valid_session
          expect(assigns(:event_enquiry)).to be_a_new(EventEnquiry)
        end

        it 're-renders the "new" template' do
          post :create, { event_id: event.id, event_enquiry: invalid_attributes }, valid_session
          expect(response).to render_template('new')
        end
      end
    end
  end
end
