Rails.application.routes.draw do
  
  root to: 'home#index'
  
  resources :curriculos, except: [:index]
  
  devise_for :usuarios
  
  

end
