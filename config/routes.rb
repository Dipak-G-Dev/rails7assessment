Rails.application.routes.draw do
  root 'homepages#home'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end

  resources :users
  resources :projects do
    resources :tasks
  end

  resources :tasks do
    resources :comments
  end
end
