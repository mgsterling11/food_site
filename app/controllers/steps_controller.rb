class StepsController < ApplicationController
  def update
    step = Step.find(params[:id])
    @recipe = Recipe.find(step.recipe.id)
    steps = @recipe.steps
    if step.recipe.user_id == current_user.id 
      step.update(step_params)
      render_step_partial(params['step']['index'].to_i, step)
    else
      render_step_partial(params['step']['index'].to_i, step)
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
      render_step_partial(params['data-index-id'].to_i, step)
    end
  end

  private
  def step_params
    params.require(:step).permit(:description)
  end

  def render_step_partial(index, step)
    html_string = render_to_string "steps/_step", locals: {index: index, step: step}, layout: false
    render json: {template: html_string}
  end
end