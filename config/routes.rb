Rails.application.routes.draw do
  get 'welcome/index'

  mount_devise_token_auth_for 'User', at: 'auth'
  resources :campaigns 
  resources :comments
  resources :tags
  resources :users do
    collection do
      get 'currentuser'
      get 'user_sign_in'
    end
  end
  resources :discussiontopics
  root :to => 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
