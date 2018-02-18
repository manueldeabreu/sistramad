class AddFacultyAndDepartmentToEmployees < ActiveRecord::Migration[5.1]
  def change
    add_column :employees, :faculty_classification_id, :integer
    add_column :employees, :department_classification_id, :integer
  end
end
