MyAutoBiography::Application.routes.draw do
  devise_for :users
  resources :landing
  get "autobio/index"

  root :to => 'landing#index'
end
