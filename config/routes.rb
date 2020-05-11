Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users, only: [:new, :create, :index, :show]
resources :books, only: [:new, :create, :index, :show]
resources :home, only: [:new, :create, :index, :show]
get 'top' => 'users#top'
  root 'users#top'
  get 'home/about' => 'home#about'
end
