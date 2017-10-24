class AddTransferAttachmentfield < ActiveRecord::Migration
  def change

    add_transfer_attachment :transfer_attachments,:file
  end
end
