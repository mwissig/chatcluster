Rails.application.routes.draw do
  get 'posts/new'
  get 'posts/index'
  get 'posts/edit'
  get 'posts/show'
  root 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
