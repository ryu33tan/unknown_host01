class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.integer :room_id
      t.integer :user_id
      t.string :message

      t.timestamps
    end
  end
end
