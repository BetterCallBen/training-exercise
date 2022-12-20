require "rails_helper"

RSpec.describe AdoptionsController, type: :request do
  describe "POST #create" do
    it "creates an adoption and redirects to the tree's page" do
      # sign_in the user before performing the request
      user = FactoryBot.create(:user)
      sign_in user
      tree = FactoryBot.create(:tree)
      adoption = FactoryBot.build(:adoption)

      # Use the proper syntax for sending a POST request with parameters
      post "/trees/#{tree.id}/adoptions", params: { adoption: adoption.attributes }

      # Check that the adoption was created and persisted in the database
      expect(assigns(:adoption)).to be_a(Adoption)
      expect(assigns(:adoption)).to be_persisted
      expect(tree.adoptions.count).to eq(1)
      expect(tree.adoptions.first.user).to eq(user)

      # Check that the response is a redirect to the tree's page
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to("/trees/#{tree.id}")
    end
  end
end
