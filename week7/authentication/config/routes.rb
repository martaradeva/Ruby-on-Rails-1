Rails.application.routes.draw do

  root 'login' => 'users#login'

  get 'login' => 'users#login'
  post 'login' => 'users#authenticate'
  # get 'logout' => 'users#logout'
  post 'logout' => 'users#logout'

  get 'signup' => 'users#new'
  post 'signup' => 'users#create'

  get '/profile/:user_id' => 'users#show'

  get '/profile/:user_id/edit' => 'users#edit'
  post '/profile/:user_id/edit' => 'users#update'

end
