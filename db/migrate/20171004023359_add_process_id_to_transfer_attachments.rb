class AddProcessIdToTransferAttachments < ActiveRecord::Migration[5.1]
  def change
    add_column :transfer_attachments, :process_id, :integer
  end
end
