Rails.application.routes.draw do
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
