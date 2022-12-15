require 'rails_helper'

RSpec.describe TreesController, type: :request do
  describe "controller" do
    it "creates a tree and redirects to the good tree's page" do

      get "/trees/new"
      expect(response).to render_template("trees/new")
      expect(response).to_not render_template(:show)

      Tree.destroy_all
      @user = FactoryBot.create(:user)
      sign_in @user
      post "/trees", :params => { tree: FactoryBot.build(:tree).attributes }
      expect(assigns(:tree)).to be_a(Tree)
      expect(assigns(:tree)).to be_persisted
      expect(response).to redirect_to(assigns(:tree))
      expect(Tree.count).to eq(1)
    end

    it "updates a tree and redirects to the good tree's page" do
      @user = FactoryBot.create(:user)
      sign_in @user
      tree = FactoryBot.create(:tree)
      get "/trees/#{tree.id}/edit"
      expect(response).to render_template(:edit)
      expect(response).to_not render_template(:new)

      patch "/trees/#{tree.id}", :params => { tree: tree.attributes }
      p assigns(:tree) == nil
      expect(assigns(:tree)).to be_a(Tree)
      expect(assigns(:tree)).to be_persisted
      expect(response).to redirect_to(assigns(:tree))

      follow_redirect!

      expect(response).to render_template(:show)
    end

    it "the index render the good template" do
      get "/trees"
      expect(response).not_to render_template(:show)
      expect(response).to render_template(:index)
    end

    it "the show render the good template" do
      FactoryBot.create(:tree)
      get "/trees/#{Tree.last.id}"
      expect(response).not_to render_template(:index)
      expect(response).to render_template(:show)
    end
  end
end
