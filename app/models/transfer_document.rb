class TransferDocument < ActiveRecord::Base

  has_many :transfer_attachments
  accepts_nested_attributes_for :transfer_attachments

end
