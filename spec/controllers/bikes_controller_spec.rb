require 'rails_helper'

RSpec.describe BikesController, type: :controller do

  let(:bike) { Bike.create!(number: "bike_1") }
  let(:id) { bike.id }
  let(:valid_attributes) { { number: "bike_1" } }
  let(:invalid_attributes) { { number: "" } }
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Bike.create! valid_attributes
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: bike.to_param}
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      bike = Bike.create! valid_attributes
      get :edit, params: {id: bike.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Bike" do
        expect {
          post :create, params: {bike: valid_attributes}, session: valid_session
        }.to change(Bike, :count).by(1)
      end

      it "redirects to the created bike" do
        post :create, params: {bike: valid_attributes}, session: valid_session
        expect(response).to redirect_to(bikes_url)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, xhr: true, params: {bike: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested bike" do
        put :update, xhr: true, params: {id: bike.to_param, bike: {number: 'bike_2'}}, session: valid_session
        bike.reload
      end

      it "redirects to the bikes" do
        put :update, params: {id: bike.to_param, bike: valid_attributes}, session: valid_session
        expect(response).to redirect_to(bikes_url)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, xhr: true, params: {id: bike.to_param, bike: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested bike" do
      expect {
        delete :destroy, params: {id: bike.to_param}, session: valid_session
      }.to change(Bike.discarded, :count).by(1)
    end

    it "redirects to the bikes list" do
      delete :destroy, params: {id: bike.to_param}, session: valid_session
      expect(response).to redirect_to(bikes_url)
    end
  end

end
