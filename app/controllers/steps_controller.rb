class StepsController < ApplicationController
  def update
    step = Step.find(params[:id])
    @recipe = Recipe.find(step.recipe.id)
    steps = @recipe.steps
    if step.recipe.user_id == current_user.id 
        step.update(step_params)
        html_string = render_to_string "steps/_step", locals: {index: params['step']['index'].to_i, step: step}, layout: false
        render json: {template: html_string}
      else
        html_string = render_to_string "steps/_step", locals: {index: params['step']['index'].to_i, step: step}, layout: false
        render json: {template: html_string}
      end
  end

  def destroy
    step = Step.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
    steps = @recipe.steps
     if @recipe.user_id == current_user.id 
        step.destroy
        html_string = render_to_string "recipes/_steps_show", locals: {index: params['data-index-id'].to_i, steps: steps}, layout: false
        render json: {template: html_string}
       else
        html_string = render_to_string "steps/_step", locals: {index: params['data-index-id'].to_i, step: steps}, layout: false
        render json: {template: html_string}
      end
  end

  private
  def step_params
    params.require(:step).permit(:description)
  end
end