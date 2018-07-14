Rails.application.routes.draw do
  get 'top', to: 'top#index'
  get 'top/show/:id' => 'top#show', as: :top_show
  post 'top/create' => 'top#create'
  delete 'top/delete/:id' => 'top#delete', as: :top_delete
  #get 'top/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
