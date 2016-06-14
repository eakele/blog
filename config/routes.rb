Rails.application.routes.draw do
  get '/' => 'posts#index'
  get 'posts/:id/comments'=>'posts#show'
  get '/login' => 'users#login'
  post '/login' => 'users#verify'

  get '/posts/new' => 'posts#new'
  post '/posts' => 'posts#create'
  delete '/posts/destroy/:id' => 'posts#destroy'

  get '/comments/:post_id/new' => 'comments#new'
  post '/comments'  => 'comments#create'

  get '/logout' => "users#logout"
  get '/posts/:id/comments/show/' => 'comments#show'
  delete '/comments/destroy/:id' => 'comments#destroy'

  get '/posts/edit/:id' => 'posts#edit'
  patch '/posts/edit/:id' => 'posts#update'

  get '/comments/edit/:id' => 'comments#edit'
  patch '/comments/update' => 'comments#update'
end
