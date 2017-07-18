Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'drinks#new'
  get "/drinks" => "drinks#index"
  post "/drinks" => "drinks#create"
  delete "/drinks" => "drinks#destroy_all"
  delete "/drinks/:id" => "drinks#destroy"
end
