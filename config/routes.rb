Rails.application.routes.draw do
  root 'landingpage#index'
  devise_for :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/orders', to: 'orders#index'
  post '/orders/submit', to: 'orders#submit'
end
