Rails.application.routes.draw do

	#post 'users/change_role/'
	post '/users/change_role/:id', to: 'users#change_role', as: 'change_role'
	resources :users, only: [:destroy]
	 
	get 'pages/dashboard', to: 'pages#dashboard', as: 'dashboard'

	resources :posts do
		resources :comments, only: [:create, :destroy]
	end

	devise_for :users, controllers: {
		sessions: 'users/sessions',
		registrations: 'users/registrations'
	}

	root 'posts#index'
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
