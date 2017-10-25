class AddTypeOfTranslateToProfessorsTransfers < ActiveRecord::Migration[5.1]
  def change
    add_column :professors_transfers, :type_of_translate, :integer
  end
end
