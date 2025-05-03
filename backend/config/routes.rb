Rails.application.routes.draw do

  # API routes
  namespace :api do
    devise_for :users, controllers: {
      sessions: 'api/sessions'
    }, defaults: { format: :json }
    
    resources :biomarkers, only: [:index, :show, :create, :destroy]
    resources :biomarker_records, only: [:index, :create, :destroy]
  end

  # Web routes
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  root "home#index"
  
  resources :biomarkers, only: [:index, :show, :create, :destroy] do
    resources :biomarker_records, only: [:new, :create, :destroy]
  end
  
  resources :biomarker_records, only: [:index]
end 