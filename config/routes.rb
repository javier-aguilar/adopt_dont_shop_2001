Rails.application.routes.draw do

  get '/', to: 'shelters#index'
  get '/shelters', to: 'shelters#index'
  post '/shelters', to: 'shelters#create'
  get '/shelters/new', to: 'shelters#new'
  get '/shelters/:id', to: 'shelters#show'
  get '/shelters/:id/edit', to: 'shelters#edit'
  patch '/shelters/:id', to: 'shelters#update'
  delete '/shelters/:id', to: 'shelters#destroy'
  get "/shelters/:id/pets", to: 'shelters#show_pets'

  get '/pets', to: 'pets#index'
  get '/shelters/:id/pets/new', to: 'pets#new'
  post '/shelters/:id/pets', to: 'pets#create'
  get '/pets/:id', to: 'pets#show'
  get '/pets/:id/edit', to: 'pets#edit'
  patch '/pets/:id', to: 'pets#update'
end
