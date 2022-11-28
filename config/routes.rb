Rails.application.routes.draw do
  get 'home/index'
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "welcome#index"
  # root "home#index"

  resources :users
  resources :sessions

  namespace :admin do
    root 'users#index'
    resources :users do
      collection do
        get :search
      end
    end
  end

end
