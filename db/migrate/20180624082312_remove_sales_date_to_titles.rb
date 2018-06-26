class RemoveSalesDateToTitles < ActiveRecord::Migration[5.2]
  def change
  	remove_column :titles, :sales_date, :date
  end
end
