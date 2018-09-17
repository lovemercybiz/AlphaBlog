Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'

  resources :articles
  # get 'pages/home', to: 'pages#home'
  # get 'pages/about', to: 'pages#about' #would be links like 3000/pages/about
end
