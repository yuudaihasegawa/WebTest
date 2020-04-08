Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  resources :users, only:[:edit,:update,:show] do
    resources :posts, only:[:new,:create]
  end
  resources :posts, only:[:index,:show] do
    resources :responses, only:[:create]
  end
  resources :categories, only:[:index,:show]

end
