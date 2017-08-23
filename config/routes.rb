Rails.application.routes.draw do
  resources :routes
  resources :trains do
    resources :vans
  end
  resources :railway_stations do
    patch :set_index, on: :member
    patch :arrival_at, on: :member
    patch :departure_at, on: :member
  end
  get 'welcome/index'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
