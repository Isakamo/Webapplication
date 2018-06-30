class CreateTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.boolean :is_delete
      t.timestamps
    end

    create_table :threads do |t|
      t.string :name
      t.integer :user_id # FK
      t.integer :board_id # FK
      t.boolean :is_delete
      t.timestamps
    end

    create_table :boards do |t|
      t.string :name
      t.integer :user_id # FK
      t.boolean :is_delete
      t.timestamps
    end

	create_table :responses do |t|
      t.integer :thread_id # FK
      t.string :content
      t.integer :user_id # FK
      t.integer :response_id # FK
      t.boolean :is_delete
      t.integer :file_id # FK
      t.timestamps
    end

	create_table :files do |t|
      t.integer :thread_id # FK
      t.string :format
      t.boolean :is_delete
      t.integer :user_id # FK
      t.timestamps
    end
  end
end
