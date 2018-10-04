Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :complementos

  root to: 'complementos#index'


  # log in page with form:
  get '/login'     => 'sessions#new'
  # create (post) action for when log in form is submitted:
  post '/login'    => 'sessions#create'
  # delete action to log out:
  # delete '/logout' => 'sessions#destroy'
  match "/logout" => 'sessions#destroy', via: [:get, :post]

  get 'complementos/docto_pdf/:folio' => 'complementos#docto_pdf'

end
