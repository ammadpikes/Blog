Rails.application.routes.draw do
  get 'bg/new'
  get 'bg/create'

  root 'welcome#index'
  devise_for :users
end
