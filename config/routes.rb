Rails.application.routes.draw do
  # Added this route just incase we don't want 
  # to use the route with version
  # - currently point this route to the 
  # to the controller within v1 folder
  defaults format: :json do
    get '/top/confirmed', to: 'api/v1/covid_observations#confirmed'
  end

  # Routes which includes versioning
  namespace :api do
    namespace :v1 do
      defaults format: :json do
        get '/top/confirmed', to: 'covid_observations#confirmed'
      end
    end
  end
end
