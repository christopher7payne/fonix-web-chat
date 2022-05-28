class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.boolean :enabled, default: false

      t.timestamps
    end
  end
end
