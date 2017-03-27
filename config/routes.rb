Rails.application.routes.draw do
  
  
  devise_for :admin_useres, ActiveAdmin::Devise.config
  begin
    ActiveAdmin.routes(self)
  rescue Exception => e
    puts "ActiveAdmin: #{e.class}: #{e}"
  end
 
  
  
  
  root to: 'home#index'
  
  resources :curriculos, except: [:index, :destroy, :new, :create]
  resources :vagas, only: [:index, :show]
  resources :candidatos, except: [:show]
  
  devise_for :usuarios, path: "", controllers: { sessions: "usuarios/sessions", registrations: "usuarios/registrations" }, path_names: { sign_in: 'login', password: 'forgot', confirmation: 'confirm', unlock: 'unblock', sign_up: 'register', sign_out: 'signout'}

  
  

end
