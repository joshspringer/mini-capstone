Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'products#index'
  get '/products' => 'products#index'
  # make a route that shows a form
  get '/products/new' => 'products#new'
  get '/products/:id' => 'products#show'

  # make a route that the form will post to
end
