Rails.application.routes.draw do

  get '/dishes/:id', to: 'dishes#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


# get '/mechanics', to: 'mechanics#index'
# get '/mechanics/:id', to: 'mechanics#show'
# post '/mechanics/:id/rides/new', to: 'mechanic_rides#create'
# get '/amusement_parks/:id', to: 'amusement_parks#show'
