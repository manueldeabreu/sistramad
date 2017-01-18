class Attachment < ActiveRecord::Base
  #include Notificable

  belongs_to :user
  belongs_to :document
  belongs_to :joint_plan
  has_attached_file :file , :default_url => '/uploads'
  validates_attachment :file, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}
  validates :file, :presence => true

  def user_ids
    #self.user_id
  end

end
