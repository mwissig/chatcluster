Rails.application.routes.draw do

  root 'pages#home'
  resources :posts
  mount ActionCable.server, at: '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
