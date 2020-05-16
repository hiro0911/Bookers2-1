Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users
resources :books
resources :home
get 'top' => 'users#top'
  root 'users#top'
  get 'home/about' => 'home#about'
  get 'books' => 'books#edit'
  get 'users/user' => 'users#user'
  get 'users/edit' => 'users#edit'
delete 'books' => 'books#destroy'
  get 'users' => "users#new"


end
