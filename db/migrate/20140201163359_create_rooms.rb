class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :user1_id
      t.string :Room
      t.integer :user2_id

      t.timestamps
    end
  end
end
