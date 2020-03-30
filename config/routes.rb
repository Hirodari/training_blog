Rails.application.routes.draw do
  root 'welcome#home'
  get 'about', to: 'welcome#about'
  get 'signup', to:'users#new'
  resources :articles
  resources :users

  get    'login', to: 'sessions#new'
  post   'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
