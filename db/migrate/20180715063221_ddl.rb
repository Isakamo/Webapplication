class Ddl < ActiveRecord::Migration[5.2]
  def change
    drop_table( :responses, if_exists: true)
    drop_table( :up_files, if_exists: true)
    drop_table( :thres, if_exists: true)
    drop_table( :boards, if_exists: true)
    drop_table( :users, if_exists: true)
    
    create_table :users do |t|
      t.string :name
      t.string :password
      t.boolean :is_delete

      t.timestamps
    end

    create_table :boards do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.boolean :is_delete

      t.timestamps
    end

    create_table :thres do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.references :board, foreign_key: true
      t.boolean :is_delete

      t.timestamps
    end

    create_table :up_files do |t|
      t.references :thre, foreign_key: true
      t.string :format
      t.references :user, foreign_key: true
      t.boolean :is_delete

      t.timestamps
    end

    create_table :responses do |t|
      t.references :thre, foreign_key: true
      t.string :content
      t.references :user, foreign_key: true
      t.references :response, foreign_key: true
      t.references :up_file, foreign_key: true
      t.boolean :is_delete

      t.timestamps
    end

  end
end
