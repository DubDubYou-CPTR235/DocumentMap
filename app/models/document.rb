class Document < ActiveRecord::Base
  belongs_to :user
  validates :name, :upload_date, :address, :lat, :lng, :user_id, :presence => true
  has_attached_file :upload
  validates_attachment_presence :upload
  #validates_attachment_content_type :upload, :content_type => ['image/jpeg', 'image/png', 'image/gif', 'audio/mp4', 'audio/mp3', 'audio/ogg', 'audio/flac', 'audio/mpeg', 'application/pdf', 'video/mpeg', 'video/mp4', 'video/avi', 'video/quicktime', 'video/webm', 'video/x-flv']
  do_not_validate_attachment_file_type :upload
end
