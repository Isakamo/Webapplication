Rails.application.routes.draw do
  devise_for :users, :controllers => {
  :registrations => 'users/registrations',
  :sessions => 'users/sessions'
}

devise_scope :user do
  get "sign_in", :to => "users/sessions#new"
  get "sign_out", :to => "users/sessions#destroy"
  end

  get 'pages/show', to: 'pages#index'
  get 'top', to: 'top#index', as: :top
  post 'top/create', to: 'top#create'
  get 'top/list/:id', to: 'top#show', as: :top_show
  delete 'top/delete/:id', to: 'top#delete', as: :top_delete
  post 'list/create', to: 'list#create', as: :list_create
  get 'res/:id', to: 'list#show', as: :list_show
  post 'res/create', to: 'list#create_res', as: :list_create_res
  #get 'top/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
