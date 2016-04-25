Rails.application.routes.draw do
  resources :responses
  resources :emails
  resources :survey_resps

  root to: "emails#index"
end
