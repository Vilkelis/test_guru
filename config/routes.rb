# frozen_string_literal: true

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  root 'pages#index'

  # Auth with devise
  devise_for :users,
             path: :gurus,
             path_names: { sign_in: :login, sugn_out: :logout }

  # Tests for several users
  resources :tests, only: :index do
    member do
      post :start
    end
  end

  # Test passage
  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  # Tests for admin users
  namespace :admin do
    root 'tests#index'
    resources :tests, except: :index do
      resources :questions, shallow: true, except: %i[index] do
        resources :answers, shallow: true, except: %i[index]
      end
    end
  end
end
