class DropTables < ActiveRecord::Migration[5.2]
  def change
  	drop_table :users
  	drop_table :threads
  	drop_table :boards
  	drop_table :responses
  	drop_table :files
  end
end
