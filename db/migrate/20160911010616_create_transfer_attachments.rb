class CreateTransferAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :transfer_attachments do |t|
      t.references :user
      t.references :transfer_document
      t.string :link

      t.timestamps null: false
    end
  end
end