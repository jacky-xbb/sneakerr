Rails.application.routes.draw do
  resources :sneakers do
    resources :reviews
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root 'sneakers#index'

  scope '/cart/:sneaker_id' do
    post 'add', to: 'line_items#update', as: 'add_to_cart'
    delete 'remove', to: 'line_items#destroy', as: 'remove_from_cart'
  end
end
