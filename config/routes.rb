Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # <VERB> "/<ROUTE_NAME>" => "<CONTROLLER>#<CONTROLLER_ACTION>"
  root "articles#index"

  resources :articles do
    resources :comments
  end
  # Routes for the articles resource
  #  GET    /articles               -> articles#index     # Display a list of all articles
  #  POST   /articles               -> articles#create    # Create a new article
  #  GET    /articles/new           -> articles#new       # Form to create a new article
  #  GET    /articles/:id           -> articles#show      # Display a specific article
  #  GET    /articles/:id/edit      -> articles#edit      # Form to edit a specific article
  #  PATCH  /articles/:id           -> articles#update    # Update a specific article
  #  PUT    /articles/:id           -> articles#update    # Same as PATCH but for full update
  #  DELETE /articles/:id           -> articles#destroy   # Delete a specific article

  # Nested routes for the comments resource within the articles resource
  #  GET    /articles/:article_id/comments               -> comments#index    # Display a list of all comments for a specific article
  #  POST   /articles/:article_id/comments               -> comments#create   # Create a new comment for a specific article
  #  GET    /articles/:article_id/comments/new           -> comments#new      # Form to create a new comment for a specific article
  #  GET    /articles/:article_id/comments/:id           -> comments#show     # Display a specific comment for a specific article
  #  GET    /articles/:article_id/comments/:id/edit      -> comments#edit     # Form to edit a specific comment for a specific article
  #  PATCH  /articles/:article_id/comments/:id           -> comments#update   # Update a specific comment for a specific article
  #  PUT    /articles/:article_id/comments/:id           -> comments#update   # Same as PATCH but for full update
  #  DELETE /articles/:article_id/comments/:id           -> comments#destroy  # Delete a specific comment for a specific article
end
