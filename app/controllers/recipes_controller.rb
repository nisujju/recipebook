class RecipesController < ApplicationController
  before_action :recipe_entries, only: [:show]

  def show
  end

  def index
  	@recipes = Recipe.all
  end

  private

  def recipe_entries
    begin
      @fields ||= Recipe.find(params[:id]).model_entry.fields
    rescue => exception
      render plain: "Not found", status: :not_found
    end
  end
end
