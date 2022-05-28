Rails.application.routes.draw do
  get 'messages/create'
  devise_for :users
  root 'rooms#index'

  get 'rooms/index', to: 'rooms#index', as: :all_rooms
  get 'rooms/:room_id', to: 'rooms#show', as: :single_room

  resources :rooms do
    resources :messages
  end
end
