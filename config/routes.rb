Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users
  resources :bloggers do
    resources :comments
  end
end
