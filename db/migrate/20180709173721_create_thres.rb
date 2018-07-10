class CreateThres < ActiveRecord::Migration[5.2]
  def change
    create_table :thres do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.references :board, foreign_key: true
      t.boolean :is_delete

      t.timestamps
    end
  end
end
