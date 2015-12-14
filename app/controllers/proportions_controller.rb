class ProportionsController < ApplicationController

  def create
    recipe = Recipe.find(proportion_params[:recipe_id])
    ingredient = Ingredient.find_or_create_by(proportion_params.delete(:ingredient))
    unit = Unit.find_or_create_by(proportion_params.delete(:unit))
    proportion = recipe.proportions.build
    proportion.quantity = proportion_params[:quantity].to_f
    proportion.ingredient = ingredient
    proportion.unit = unit
    proportion.save
    render json: {quantity: proportion.quantity, ingredient: ingredient.name, unit: unit.name}
  end

  def update
    proportion = Proportion.find(params[:id])
    @recipe = Recipe.find(proportion_params[:recipe_id])
    proportions = @recipe.proportions
    if @recipe.user_id == current_user.id 
      proportion.update(quantity: proportion_params[:quantity].to_f)
      proportion.ingredient_id = Ingredient.find_or_create_by(proportion_update_params[:ingredient_attributes]).id
      proportion.unit_id = Unit.find_or_create_by(proportion_update_params[:unit_attributes]).id
      if proportion.save
        html_string = render_to_string "proportions/_proportion", locals: {proportion: proportion}, layout: false
        render json: {template: html_string, action: 'update'}
      end
    else
      html_string = render_to_string "proportions/_proportion", locals: {proportion: proportion}, layout: false
      render json: {template: html_string, action: 'update'}
    end
  end

  def destroy
    proportion = Proportion.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
    proportions = @recipe.proportions
    if @recipe.user_id == current_user.id 
      proportion.destroy
      html_string = render_to_string "recipes/_proportions_show", locals: {proportions: proportions}, layout: false
      render json: {template: html_string, action: 'destroy'}
    else
      html_string = render_to_string "proportions/_proportion", locals: {proportion: proportion}, layout: false
      render json: {template: html_string, action: 'update'}
    end
  end


  private
  def proportion_params
    params.require(:proportion).permit(:recipe_id, :quantity, :ingredient => [:name], :unit => [:name])
  end

  def proportion_update_params
    params.require(:proportion).permit(:id, :quantity, :recipe_id, :ingredient_ids => [], 
      :ingredient_attributes =>[:name], :unit_ids => [], :unit_attributes => [:name])
  end

end
