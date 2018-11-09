Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get 'welcome/page', to: 'welcome#page'
get 'welcome/about', to: 'welcome#about'
get 'bikes/index', to: 'bikes#index'

resources :articles do
  resources :comments
  get :test_2, on: :collection
end

resources :contacts, except: [:update]

resources :bikes

get 'signup', to: 'users#new'
resources :users, except: [:new]

get 'login', to: 'sessions#new'
post 'login', to: "sessions#create"
delete 'logout', to: 'sessions#destroy'


end
