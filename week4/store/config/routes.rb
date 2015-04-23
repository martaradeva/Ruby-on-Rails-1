Rails.application.routes.draw do

  get '/brands/count', to: 'brands#count'
  resources :brands, only: [:index, :show, :create, :update, :destroy]
  get '/brands/range/:index/:count', to: 'brands#index'
  get '/brands/range/:index', to: 'brands#index'

  # same for categories
  # same for products

  get '/search/:type_property_slug', to: 'search#search'

  root 'brands#index'
end
