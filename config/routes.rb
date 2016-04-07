Rails.application.routes.draw do
  resources :responses
  resources :emails

  root to: "emails#index"
end
