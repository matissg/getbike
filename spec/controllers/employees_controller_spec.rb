require 'rails_helper'

RSpec.describe EmployeesController, type: :controller do

  let(:employee) { Employee.create!(name: "Matiss") }
  let(:id) { employee.id }
  let(:valid_attributes) { { name: "Matiss" } }
  let(:invalid_attributes) { { name: "" } }
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Employee.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: employee.to_param}, session: valid_session
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
      get :edit, params: {id: employee.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Employee" do
        expect {
          post :create, params: {employee: valid_attributes}, session: valid_session
        }.to change(Employee, :count).by(1)
      end

      it "redirects to the created employee" do
        post :create, params: {employee: valid_attributes}, session: valid_session
        expect(response).to redirect_to(employees_url)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, xhr: true, params: {employee: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: "John" }
      }

      it "updates the requested employee" do
        put :update, xhr: true, params: {
          id: employee.to_param, employee: new_attributes
          }, session: valid_session
        employee.reload
      end

      it "redirects to the employee" do
        put :update, xhr: true, params: {
          id: employee.to_param, employee: valid_attributes
          }, session: valid_session
        expect(response).to redirect_to(employees_url)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, xhr: true, params: {
          id: employee.to_param, employee: invalid_attributes
          }, session: valid_session
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested employee" do
      expect {
        delete :destroy, params: {id: employee.to_param}, session: valid_session
      }.to change(Employee.discarded, :count).by(1)
    end

    it "redirects to the employees list" do
      delete :destroy, params: {id: employee.to_param}, session: valid_session
      expect(response).to redirect_to(employees_url)
    end
  end

end
