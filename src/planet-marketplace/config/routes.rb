# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do

  #Root / Index / Home
  root "listings#home"

  # User - Devise Authenticated
  devise_for :users, path_names: {
    sign_in: 'login', sign_out: 'logout',
    password: 'secret', confirmation: 'verification',
    registration: 'register'},
    controllers: { registrations: "registrations" }
  
  # Delete User #
  # match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  # match 'users/:id' => 'users#show', as: :user
  # resources :users

  # New Profile #
  get    '/profile/new' , to: 'profiles#new', as: "new_profile"
  post   '/profiles'    , to: 'profiles#create', as: "create_profile"

  # View Profile #
  get    '/profile/:id' , to: 'profiles#view', as: "view_profile"

  # Edit & Update Profile #
  get    '/profile/:id/edit' , to: 'profiles#edit', as: "edit_profile"
  patch  '/profile/:id' , to: 'profiles#update',    as: "update_patch_profile"
  put    '/profile/:id' , to: 'profiles#update',    as: "update_put_profile"

  # Delete Profile #
  delete '/profile/:id' , to: 'profiles#destroy',   as: "destroy_profile"
  
end