class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: 'Salt')
    @recipe.ingredients.build(name: 'Hot Pepper')
  end

  def create
    @recipe = Recipe.create(recipe_params)
    # puts @recipe.inspect
    # puts recipes_params.inspect
    redirect_to @recipe
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title,
    ingredients_attributes: [
      :name, :quantity
      ])
 end
end
