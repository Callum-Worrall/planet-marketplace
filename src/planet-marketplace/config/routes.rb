# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do

  #Root / Index / Home
  root "listings#home"

  # User - Devise Authenticated
  devise_for :users, path_names: {
    sign_in: 'login', sign_out: 'logout',
    password: 'password', confirmation: 'verification',
    registration: 'register', edit: 'edit'},
    controllers: { registrations: "registrations" }


  # PROFILES #########################################################################
  # New Profile #
  get    '/profile/new',      to: 'profiles#new',     as: "new_profile"
  post   '/profiles',         to: 'profiles#create',  as: "create_profile"

  # View Profile #
  get    '/profile/:id',      to: 'profiles#view',    as: "view_profile"

  # Edit & Update Profile #
  get    '/profile/:id/edit', to: 'profiles#edit',    as: "edit_profile"
  patch  '/profile/:id',      to: 'profiles#update',  as: "update_patch_profile"
  put    '/profile/:id',      to: 'profiles#update',  as: "update_put_profile"

  # Delete Profile #
  delete '/profile/:id',      to: 'profiles#destroy', as: "destroy_profile"


  # LISTINGS ########################################################################
  # New Listing #
  get    '/listing/new',      to: 'listings#new',     as: "new_listing"
  post   '/listings',         to: 'listings#create',  as: "create_listing"

  # View Listing #
  get    '/listing/:id',      to: 'listings#view',    as: "view_listing"

  # Edit & Update Listing #
  get    '/listing/:id/edit', to: 'listings#edit',    as: "edit_listing"
  patch  '/listing/:id',      to: 'listings#update',  as: "update_patch_listing"
  put    '/listing/:id',      to: 'listings#update',  as: "update_put_listing"

  # Delete Listing #
  delete '/listing/:id',      to: 'listings#destroy', as: "destroy_listing"

  patch  '/listing/:id',      to: 'listings#purchase',  as: "purchase_listing"

  # PLANETS #########################################################################
  # New Planet #
  get    '/planet/new',      to: 'planets#new',     as: "new_planet"
  post   '/planets',         to: 'planets#create',  as: "create_planet"

  # Edit & Update Planet #
  get    '/planet/:id/edit', to: 'planets#edit',    as: "edit_planet"
  patch  '/planet/:id',      to: 'planets#update',  as: "update_patch_planet"
  put    '/planet/:id',      to: 'planets#update',  as: "update_put_planet"

  # Delete Planet #
  delete '/planet/:id',      to: 'planets#destroy', as: "destroy_planet"
  
end