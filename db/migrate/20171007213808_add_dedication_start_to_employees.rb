class AddDedicationStartToEmployees < ActiveRecord::Migration[5.1]
  def change
    add_column :employees, :dedication_start_date, :date
  end
end
