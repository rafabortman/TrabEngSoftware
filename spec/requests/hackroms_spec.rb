require 'rails_helper'

RSpec.describe "Hackroms", type: :request do
  describe "GET /hackroms" do
    it "works! (now write some real specs)" do
      get hackroms_path
      expect(response).to have_http_status(200)
    end
  end
end
