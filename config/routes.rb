Rails.application.routes.draw do
  get 'rooms/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resource :rooms
  root 'rooms#index'
end
