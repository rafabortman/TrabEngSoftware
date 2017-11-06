require "rails_helper"

RSpec.describe HackromsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/hackroms").to route_to("hackroms#index")
    end

    it "routes to #new" do
      expect(:get => "/hackroms/new").to route_to("hackroms#new")
    end

    it "routes to #show" do
      expect(:get => "/hackroms/1").to route_to("hackroms#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/hackroms/1/edit").to route_to("hackroms#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/hackroms").to route_to("hackroms#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/hackroms/1").to route_to("hackroms#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/hackroms/1").to route_to("hackroms#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/hackroms/1").to route_to("hackroms#destroy", :id => "1")
    end

  end
end
