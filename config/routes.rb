Rails.application.routes.draw do

  get '/dishes/:id', to: 'dishes#show'
  get '/chefs/:id', to: 'chefs#show'

end

# post '/mechanics/:id/rides/new', to: 'mechanic_rides#create'
# get '/amusement_parks/:id', to: 'amusement_parks#show'
