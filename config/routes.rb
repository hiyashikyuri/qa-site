Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :reactions
  root 'homepage#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get 'answers' => 'answers#index'
  resources :questions, shallow: true do
    resources :answers, shallow: true do
      resources :reactions
    end
  end
end
