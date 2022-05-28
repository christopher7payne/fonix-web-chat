class AddRoomsToRooms < ActiveRecord::Migration[6.1]
  def change
    Room.create_with(name: 'The weather in Huntington', enabled: true).find_or_create_by(name: 'The weather in Huntington')
    Room.create_with(name: 'A disabled room', enabled: false).find_or_create_by(name: 'A disabled room')
  end
end
