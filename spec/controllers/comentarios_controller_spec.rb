require 'rails_helper'

RSpec.describe ComentariosController, type: :controller do

  let(:valid_attributes) {
    {
      jogada_id:1,
      comentario:"teste"
    }
  }

  describe "POST #create" do
    it "returns http success" do
      expect {
        post :create, params: {jogada_id:1,comentario:"teste"}
      }.to change(Comentario, :count).by(1)
    end
  end

  describe "POST #destroy" do
    it "returns http success" do
      comentario = Comentario.create! valid_attributes
      expect {
        delete :destroy, params: {id: comentario.to_param}
      }.to change(Comentario, :count).by(-1)
    end
  end

end
