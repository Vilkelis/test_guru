# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tests, only: %i[] do
    resources :questions, shallow: true, except: %i[edit update]
  end
end
