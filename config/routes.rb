Rails.application.routes.draw do
  root 'questions#index'
  resources :questions
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end
