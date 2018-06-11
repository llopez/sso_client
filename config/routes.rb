Rails.application.routes.draw do
  get 'profile' => 'profile#show'
  root to: 'profile#show'

  get '/auth/:provider/callback', :to => 'user_sessions#create'
  get '/auth/failure', :to => 'user_sessions#failure'
end
