Rails.application.routes.draw do
  devise_for :users
  
  root "home#index"
  
  resources :biomarkers, only: [:index, :show, :create, :destroy] do
    resources :biomarker_records, only: [:new, :create, :destroy]
  end
  
  resources :biomarker_records, only: [:index]
end 