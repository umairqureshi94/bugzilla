Rails.application.routes.draw do
  get 'bugs/index'
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :projects do
  	
  	get 'users'
  	put 'add'
    delete 'remove'

  	resources :bugs do
      member do
        get 'assign'
        get 'resolved'
      end
    end

  end

  root 'home#index'
end
