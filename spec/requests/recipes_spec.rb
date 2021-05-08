require 'rails_helper'

RSpec.describe "Recipes", type: :request do

  let(:recipe) do
    FactoryBot.build(:recipe)
  end

  describe "GET /recipes" do
    it "returns http success" do
      get "/recipes"
      expect(response).to have_http_status(:success)
    end

    it "should find all recipes before rendering" do
      expect(Recipe).to receive(:all)
      get "/recipes"
    end

    it "should render index template" do
      get "/recipes"
      expect(response).to render_template(:index)
    end
  end

  describe "GET /recipe/:id" do
    before do
      recipe.save
      obj = double()
      allow(obj).to receive(:fields).and_return({})
      allow_any_instance_of(Recipe).to receive(:model_entry).and_return(obj)
    end

    it "returns http success" do
      id = Recipe.first.id
      get "/recipes/#{id}"
      expect(response).to have_http_status(:success)
    end

    it "should render shows template" do
      id = Recipe.first.id
      get "/recipes/#{id}"
      expect(response).to render_template(:show)
    end
  end
end