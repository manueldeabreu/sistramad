class AddDedicationToEmployees < ActiveRecord::Migration[5.1]
  def change
    add_column :employees, :dedication_classification_id, :integer
  end
end
