Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get "/index", to: "tasks#index"
  get "/index/:id", to: "tasks#show", as: :task

  get "/tasks/new", to: "tasks#new"   # gets the form
  post "/tasks", to: "tasks#create" # post (creating id)

  # Update (two HTTP Requests)
  get "/index/:id/edit", to: "tasks#edit", as: :edit # gets filled in form
  patch "/index/:id", to: "tasks#update" #saves it

  # Delete
  delete "/index/:id", to: "tasks#destroy", as: :destroy
end
