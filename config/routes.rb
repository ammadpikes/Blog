Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'welcome#index'
  devise_for :users
  resources :bloggers do
    resources :comments
  end
  resources :conversations do
    resources :messages
  end
end
