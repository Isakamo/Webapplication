Rails.application.routes.draw do
  get 'top', to: 'top#index'
  post 'top/create', to: 'top#create'
  get 'top/list/:id', to: 'top#show', as: :top_show
  delete 'top/delete/:id', to: 'top#delete', as: :top_delete
  post 'list/create', to: 'list#create', as: :list_create
  get 'res/:id', to: 'list#show', as: :list_show
  #get 'top/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
