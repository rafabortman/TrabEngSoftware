require "rails_helper"

RSpec.describe TorneiosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/torneios").to route_to("torneios#index")
    end

    it "routes to #new" do
      expect(:get => "/torneios/new").to route_to("torneios#new")
    end

    it "routes to #show" do
      expect(:get => "/torneios/1").to route_to("torneios#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/torneios/1/edit").to route_to("torneios#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/torneios").to route_to("torneios#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/torneios/1").to route_to("torneios#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/torneios/1").to route_to("torneios#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/torneios/1").to route_to("torneios#destroy", :id => "1")
    end

  end
end
