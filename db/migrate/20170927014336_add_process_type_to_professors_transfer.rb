class AddProcessTypeToProfessorsTransfer < ActiveRecord::Migration[5.1]
  def change
    add_column :professors_transfers, :process_type, :integer
  end
end
