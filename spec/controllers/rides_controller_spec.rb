require 'rails_helper'

RSpec.describe RidesController, type: :controller do

  # Employees
  let(:employee) { Employee.create!(name: "Matiss") }
  let(:second_employee) { Employee.create!(name: "John") }
  # Bikes
  let(:bike) { Bike.create!(number: "bike_1") }
  let(:second_bike) { Bike.create!(number: "bike_2") }
  # Rides
  let(:ride) { Ride.create!(
    employee_id: employee.id,
    bike_id: bike.id,
    starts_ends: "#{1.day.from_now} - #{2.days.from_now}"
  ) }
  let(:id) { ride.id }

  let(:valid_attributes) { {
    employee_id: employee.id,
    bike_id: bike.id,
    starts_ends: "#{1.day.from_now} - #{2.days.from_now}"
    } }

  let(:invalid_attributes) { {
    employee_id: nil,
    bike_id: nil,
    starts_ends: "#{2.day.from_now} - #{1.days.from_now}"
    } }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Ride.create! valid_attributes
      get :index, params: {}, session: valid_session
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
      ride_2 = Ride.create! valid_attributes
      get :edit, params: {id: ride_2.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      before do
        Bike.create!(number: "bike_3")
      end
      it "creates a new Ride" do
        expect {
          post :create, xhr: true, params: {ride: valid_attributes}, session: valid_session
        }.to change(Ride, :count).by(1)
      end

      it "redirects to the created ride" do
        ride_2 = Ride.create! valid_attributes
        post :create, xhr: true, params: {ride: valid_attributes}, session: valid_session
        expect(response).to redirect_to(employee_path(ride_2.employee_id))
      end
    end

    context "with invalid params" do
      before do
        Bike.create!(number: "bike_3")
      end
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, xhr: true, params: {ride: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { {
        bike_id: bike.id,
        employee_id: employee.id,
        starts_ends: "#{2.day.from_now} - #{3.days.from_now}"
      } }

      before do
        Bike.create!(number: "bike_3")
      end
      it "updates the requested ride" do
        put :update, xhr: true, params: {id: ride.to_param, ride: new_attributes}, session: valid_session
        ride.reload
      end

      it "redirects to the ride" do
        put :update, xhr: true, params: {id: ride.to_param, ride: valid_attributes}, session: valid_session
        expect(response).to redirect_to(employee_path(ride.employee_id))
      end
    end

    context "with invalid params" do
      before do
        Bike.create!(number: "bike_3")
      end
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, xhr: true, params: {id: ride.to_param, ride: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested ride" do
      new_ride = Ride.create!(
        employee_id: employee.id,
        bike_id: bike.id,
        starts_ends: "#{1.day.from_now} - #{2.days.from_now}"
      )
      expect {
        delete :destroy, params: {id: new_ride.to_param}, session: valid_session
      }.to change(Ride, :count).by(-1)
    end

    it "redirects to the rides list" do
      delete :destroy, params: {id: ride.to_param}, session: valid_session
      expect(response).to redirect_to(rides_url)
    end
  end

end
