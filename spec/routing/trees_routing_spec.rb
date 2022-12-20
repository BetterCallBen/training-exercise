require "rails_helper"

RSpec.describe TreesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/trees").to route_to("trees#index")
    end

    it "routes to #new" do
      expect(get: "/trees/new").to route_to("trees#new")
    end

    it "routes to #show" do
      expect(get: "/trees/1").to route_to("trees#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/trees/1/edit").to route_to("trees#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/trees").to route_to("trees#create")
    end

    it "routes to #update" do
      expect(patch: "/trees/1").to route_to("trees#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/trees/1").to route_to("trees#destroy", id: "1")
    end
  end
end
