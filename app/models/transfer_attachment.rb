class TransferAttachment < ActiveRecord::Base
  #include Notificable

  belongs_to :user
  belongs_to :transfer_document
  belongs_to :joint_plan
  belongs_to :professors_transfer
  belongs_to :process_id, :class_name => 'ProfessorsTransfer', :foreign_key => 'process_id'
  has_attached_file :file , :default_url => '/uploads'
  validates_attachment :file, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf )}
  validates :file, :presence => true

  def user_ids
    #self.user_id
  end

end
