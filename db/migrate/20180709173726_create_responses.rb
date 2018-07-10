class CreateResponses < ActiveRecord::Migration[5.2]
  def change
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
