Rails.application.routes.draw do
  namespace :admin do
    get 'restaurants/index'
  end
  get 'reviews/new'
  resources :restaurants do 
  	
  	collection do 
  		get 'top', to: 'restaurants#top'
  	end
  	member do
  		get 'chef', to: 'restaurants#chef'
  	end
  	resources :reviews, only: [:new, :create]

  end

  namespace :admin do
    resources :restaurants, only: [:index]
  end

  resources :reviews, only: [ :show, :edit, :update, :destroy ]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
