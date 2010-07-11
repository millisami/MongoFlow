MongoFlow::Application.routes.draw do
  root :to => 'items#index'

  devise_for :users
  
  resources :items do
    resources :comments
  end

  match '/star/add' => 'stars#add', :as => :add_star
  match '/star/remove' => 'stars#remove', :as => :remove_star

  resources :categories
  resources :users
  resource :session
  
  match '/signup' => 'users#new', :as => :signup
  match '/login' => 'session#new', :as => :login
  match '/logout' => 'session#destroy', :as => :logout
  match '/tag/:id' => 'items#list_for_tags', :as => :tag
  match '/tags/:id' => 'items#list_for_tags', :as => :tags
  match '/tags/*id' => 'items#list_for_tags', :as => :tags_by_folders
  match '/search/:id' => 'items#search', :as => :search
  match '/category/:id' => 'items#category', :as => :category
  match '/page/:page' => 'items#index'

  match '/:controller(/:action(/:id))'
end
