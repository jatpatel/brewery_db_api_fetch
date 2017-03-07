Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: 'json' } do
    jsonapi_resources :beers do
        get 'beers/', to: 'beers#index'
        get 'beers/:id', to: 'beers#show'
    end
  end

end
