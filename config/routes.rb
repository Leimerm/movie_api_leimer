Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

# namespace :api, defaults: { format: :json } do
#   namespace :v1 do
#     namespace :users do
#       post :login
#       post :create
#       get :me
#       delete :logout
#     end
#   end
# end