require "rails_helper"

RSpec.describe AdoptionsController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(post: "/trees/1/adoptions").to route_to("adoptions#create", tree_id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/trees/1/adoptions/1").to route_to("adoptions#destroy", tree_id: "1", id: "1")
    end
  end
end
