Rails.application.routes.draw do
  	resources :class_statuses
	resources :class_lists
	devise_for :users
	resources :comments
	resources :articles
	resources :tests
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	root 'class_lists#index'
end
