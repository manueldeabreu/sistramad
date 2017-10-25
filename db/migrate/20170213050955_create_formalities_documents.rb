class CreateFormalitiesDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :formalities_documents do |t|
      t.references :formalities_master, index: true, foreign_key: true
      t.references :transfer_document, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
