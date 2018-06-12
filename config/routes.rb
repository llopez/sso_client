Rails.application.routes.draw do
  get 'profile' => 'profile#show'
  root to: 'profile#show'

  get '/auth/:provider/callback' => 'user_sessions#create'
  get '/auth/failure' => 'user_sessions#failure'

  delete 'logout' => 'user_sessions#destroy', as: :logout
end
