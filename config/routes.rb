MyAutoBiography::Application.routes.draw do

  devise_for :users
	resources :landing do
		post 'add_description_of_homepage', :on => :collection
	end
  	resources :autobio

  	resources :about do
  		get 'get_jason_data', :on => :collection
  	end
  	root :to => 'landing#index'
end
