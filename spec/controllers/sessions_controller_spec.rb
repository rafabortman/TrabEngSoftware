require 'rails_helper'
require 'coveralls'
Coveralls.wear!

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to be_success
    end
  end

end
