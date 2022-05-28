Rails.application.routes.draw do
  devise_for :users
  root 'rooms#index'

  get 'rooms/index', to: 'rooms#index', as: :all_rooms
  get 'rooms/:room_id', to: 'rooms#show', as: :single_room
end
