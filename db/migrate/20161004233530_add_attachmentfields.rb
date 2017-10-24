class AddAttachmentfield < ActiveRecord::Migration
  def change

    add_attachment :transfer_attachments,:file
  end
end
