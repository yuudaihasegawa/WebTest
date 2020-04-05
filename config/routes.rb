Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  resources :users, only:[:edit,:update,:show,:destroy] do
    resources :posts, only:[:new,:create]
  end
  resources :posts, only:[:index,:show]
end
