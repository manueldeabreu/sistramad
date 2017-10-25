class AddProcessIdToTransferAttachments < ActiveRecord::Migration
  def change
    add_column :transfer_attachments, :process_id, :integer
  end
end
