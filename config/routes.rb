Rails.application.routes.draw do

  root to: 'tasks#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'sign_out', to: 'sessions#destory'

  resources :tasks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
