Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users
  resources :bloggers do
    resource :comments, only: [:create, :destroy]
  end
end
