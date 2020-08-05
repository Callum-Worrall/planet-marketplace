Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "listings#home"

  get    '/signup'   , to: 'users#signup', as: "user_signup" #new
  post   '/users'    , to: 'users#create'

  get    '/login'    , to: 'users#login',     as: "user_login"

  get    '/user/:id' , to: 'users#edit',      as: "edit_user"
  patch  '/user/:id' , to: 'users#update',    as: "update_patch_user"
  put    '/user/:id' , to: 'users#update',    as: "update_put_user"
  delete '/user/:id' , to: 'users#destroy',   as: "destroy_user"

end
