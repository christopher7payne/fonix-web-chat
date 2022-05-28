Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  devise_for :users
  root 'rooms#index'

  get 'rooms/index', to: 'rooms#index', as: :all_rooms
  get 'rooms/:room_id', to: 'rooms#show', as: :single_room

  resources :rooms do
    resources :messages
  end
end
