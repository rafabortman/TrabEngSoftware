require 'rails_helper'

RSpec.describe "Torneios", type: :request do
  describe "GET /torneios" do
    it "works! (now write some real specs)" do
      get torneios_path
      expect(response).to have_http_status(200)
    end
  end
end
