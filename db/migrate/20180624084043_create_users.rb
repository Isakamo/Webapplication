class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :user do |t|
      t.integer :user_id
      t.string :handle_name
      t.string :password
      t.boolean :delete
      t.timestamps
    end
    create_table :thread do |t|
      t.integer :thread_id
      t.string :thread_name
      t.integer :create_user_id
      t.integer :board_id
      t.boolean :delete
      t.timestamps
    end

    create_table :board do |t|
      t.integer :board_id
      t.string :board_name
      t.integer :create_user_id
      t.boolean :delete
      t.timestamps
    end
  end
end
