Rails.application.routes.draw do
  root 'homes#show'
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update]
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  
  get '/home/about' => "homes#about"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
