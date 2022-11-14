Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :payment_requests, only: [:index] do
    post :accept
    post :reject
  end  
  # Defines the root path route ("/")
  # root "articles#index"
end
