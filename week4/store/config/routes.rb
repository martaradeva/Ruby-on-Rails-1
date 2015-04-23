Rails.application.routes.draw do

  resources :brands, only: [:index, :show, :create, :update, :destroy]
  get '/brands/count', to: 'brands#count'
  get '/brands/range/:index/:count', to: 'brands#index'
  get '/brands/range/:index', to: 'brands#index'

  # same for categories
  # same for products

  get '/search/:type/:property/:slug', to: 'search#search'
  get '/search/:type/:slug', to: 'search#search'

  root 'brands#index'
end
