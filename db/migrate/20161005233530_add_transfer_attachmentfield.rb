class AddTransferAttachmentfield < ActiveRecord::Migration[5.1]
  def change

    add_attachment :transfer_attachments,:file
  end
end