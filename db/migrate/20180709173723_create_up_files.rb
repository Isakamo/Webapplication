class CreateUpFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :up_files do |t|
      t.references :thre, foreign_key: true
      t.string :format
      t.references :user, foreign_key: true
      t.boolean :is_delete

      t.timestamps
    end
  end
end
