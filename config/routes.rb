Rails.application.routes.draw do
  resources :searches, only: :index
  resources :proportions, only: [:create, :update, :destroy]
  resources :steps, only: [:update, :destroy]
  root to: 'welcome#index'
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  post '/recipes/new' => 'recipes#create'

  resources :users, only: [:new, :create, :show]
  resources :recipes, except: :edit do
    resources :shopping_lists
  end
  
  get 'admin/dashboard' => 'admins#dashboard'
  get 'admin/most_viewed' => 'admins#most_viewed'
  get 'admin/most_favorited' => 'admins#most_favorited'
  get 'admin/top_ingredients' => 'admins#top_ingredients'
  get 'states/data' => 'states#data'
  get 'states/map' => 'states#map'

  resources :favorites, only: :create


end
