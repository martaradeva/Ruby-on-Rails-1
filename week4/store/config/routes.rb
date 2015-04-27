Rails.application.routes.draw do

  get '/brands/count', to: 'brands#count'
  resources :brands, only: [:index, :show, :create, :update, :destroy]
  post '/brands/new', to: 'brands#create'
  get '/brands/range/:index/:count', to: 'brands#index'
  get '/brands/range/:index', to: 'brands#index'

  # same for categories
  # same for products

  get '/search/*type_property/:slug', to: 'searches#search'

  root 'brands#index'
end
