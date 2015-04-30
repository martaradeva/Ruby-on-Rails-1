Rails.application.routes.draw do

  resources :lectures do
    resources :tasks do
      resources :solutions
    end
  end
  root to: 'lectures#index'
end
