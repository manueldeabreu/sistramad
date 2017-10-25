class CreateTransferDocuments < ActiveRecord::Migration
  def change
    create_table :transfer_documents do |t|
      t.string :name
      t.integer :status

      t.timestamps null: false
    end
  end
end
