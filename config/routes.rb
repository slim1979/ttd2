Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :tickets
  resources :searches

  namespace :admin do
    resources :users
    resources :trains do
      resources :vans, shallow: true
    end
    resources :railway_stations do
      patch :set_index, on: :member
      patch :set_shedule, on: :member
    end
    resources :tickets
    resources :routes
  end

  get 'welcome/index'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
