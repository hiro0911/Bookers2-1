Rails.application.routes.draw do
  devise_for :users, controllers: {
  sessions: 'users/sessions',
  registrations: 'users/registrations'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users
resources :books
resources :home
get 'top' => 'users#top'
  root 'users#top'
  get 'home/about' => 'home#about'
  get 'books/edit' => 'books#edit'
  get 'users/user' => 'users#user'
  get 'users/edit' => 'users#edit'
  get "users/:id" => "users#show"
  get "books/:id" => "users#show"
  get 'books/:id' => 'books#show'
  get 'users/:id' => 'books#show'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get     'login',   to: 'sessions#new'
  post    'login',   to: 'sessions#create'
  get     'logout',  to: 'sessions#destroy'
end
