Rails.application.routes.draw do
  get '/' => 'posts#index'
  get 'posts/:id/comments'=>'posts#show'
  get '/login' => 'users#login'
  post '/login' => 'users#verify'

  get '/logout' => "users#logout"
  get '/posts/:id/comments/show/' => 'comments#show', as: :comments
  delete '/comments/destroy' => 'comments#destroy'
end
