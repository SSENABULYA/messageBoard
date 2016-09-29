Rails.application.routes.draw do
  	devise_for :users
	resources :messages do
		resources :comments
	end
  #get 'messages/index'
  	root 'messages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
