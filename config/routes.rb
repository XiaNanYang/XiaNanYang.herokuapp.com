Rails.application.routes.draw do
  root to: 'pages#landing'
  get 'pages/landing'

  concern :commentable do
    resources :comments, shallow: true
  end

  resources :activities, concerns: :commentable do
    get 'import', on: :new
  end

  resources :places, concerns: :commentable
  resources :users, concerns: :commentable, only: []
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
