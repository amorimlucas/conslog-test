class Note < ApplicationRecord
  belongs_to :project
  validates :texto, presence: true

  mount_uploader :file, FileUploader
end
