require "rails_helper"

RSpec.describe TreesController, type: :request do
  describe "controller" do
    it "creates a tree and redirects to the tree's page" do
      user = FactoryBot.create(:user)
      sign_in user
      # Test that the new action renders the correct template
      get "/trees/new"
      expect(response).to render_template("trees/new")
      expect(response).to_not render_template(:show)

      # Test that the create action creates a new tree and redirects to the tree's page
      Tree.destroy_all
      post "/trees", params: { tree: FactoryBot.build(:tree).attributes }
      expect(assigns(:tree)).to be_a(Tree)
      expect(assigns(:tree)).to be_persisted
      expect(response).to redirect_to(assigns(:tree))
      expect(Tree.count).to eq(1)
    end

    it "updates a tree and redirects to the tree's page" do
      # Test that the edit action renders the correct template
      user = FactoryBot.create(:user)
      sign_in user
      tree = FactoryBot.create(:tree)
      get "/trees/#{tree.id}/edit"
      expect(response).to render_template(:edit)
      expect(response).to_not render_template(:new)

      # Test that the update action updates the tree and redirects to the tree's page
      patch "/trees/#{tree.id}", params: { tree: tree.attributes }
      expect(assigns(:tree)).to be_a(Tree)
      expect(assigns(:tree)).to be_persisted
      expect(response).to redirect_to(assigns(:tree))

      # Test that the show action renders the correct template
      follow_redirect!
      expect(response).to render_template(:show)
    end

    it "renders the index template" do
      user = FactoryBot.create(:user)
      sign_in user
      # Test that the index action renders the correct template
      get "/trees"
      expect(response).not_to render_template(:show)
      expect(response).to render_template(:index)
    end

    it "renders the show template" do
      user = FactoryBot.create(:user)
      sign_in user
      # Test that the show action renders the correct template
      FactoryBot.create(:tree)
      get "/trees/#{Tree.last.id}"
      expect(response).not_to render_template(:index)
      expect(response).to render_template(:show)
    end
  end
end
