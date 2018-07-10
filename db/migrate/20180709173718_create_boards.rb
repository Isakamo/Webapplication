class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.boolean :is_delete

      t.timestamps
    end
  end
end
