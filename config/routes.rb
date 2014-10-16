MyAutoBiography::Application.routes.draw do
  	devise_for :users
	resources :landing do
		post 'add_description_of_homepage', :on => :collection
	end
  	get "autobio/index"

  	root :to => 'landing#index'
end
