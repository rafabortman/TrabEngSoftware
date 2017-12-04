require 'rails_helper'
require 'coveralls'
Coveralls.wear!
RSpec.describe ContatosController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Contato. As you add validations to Contato, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      email:"teste@teste.com",
      assunto:"testes de assunto",
      corpo:"blabalablabalbalbalba",
      created_at: DateTime.now,
      updated_at: DateTime.now
    }
  }

  let(:invalid_attributes) {
    {
      email:"teste@teste.com",
      assunto:"testes de assunto",
      corpo:"blabalablabalbalbalba",
      created_at: nil,
      updated_at: nil
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ContatosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      contato = Contato.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      contato = Contato.create! valid_attributes
      get :show, params: {id: contato.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      contato = Contato.create! valid_attributes
      get :edit, params: {id: contato.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Contato" do
        expect {
          post :create, params: {contato: valid_attributes}, session: valid_session
        }.to change(Contato, :count).by(1)
      end

      it "redirects to the created contato" do
        post :create, params: {contato: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Contato.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {contato: invalid_attributes}, session: valid_session
        expect(response).not_to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          email:"teste@teste.com",
          assunto:"novos testes de assunto",
          corpo:"updated",
          created_at: DateTime.now,
          updated_at: DateTime.now
        }
      }

      it "updates the requested contato" do
        contato = Contato.create! valid_attributes
        put :update, params: {id: contato.to_param, contato: new_attributes}, session: valid_session
        contato.reload
        updatedContato = Contato.find_by(id:contato.id)
        expect(updatedContato.corpo).to eq("updated")
      end

      it "redirects to the contato" do
        contato = Contato.create! valid_attributes
        put :update, params: {id: contato.to_param, contato: valid_attributes}, session: valid_session
        expect(response).to redirect_to(contato)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        contato = Contato.create! valid_attributes
        put :update, params: {id: contato.to_param, contato: invalid_attributes}, session: valid_session
        expect(response).not_to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested contato" do
      contato = Contato.create! valid_attributes
      expect {
        delete :destroy, params: {id: contato.to_param}, session: valid_session
      }.to change(Contato, :count).by(-1)
    end

    it "redirects to the contatos list" do
      contato = Contato.create! valid_attributes
      delete :destroy, params: {id: contato.to_param}, session: valid_session
      expect(response).to redirect_to(contatos_url)
    end
  end

end
