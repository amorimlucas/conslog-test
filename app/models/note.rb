class Note < ApplicationRecord
  belongs_to :project
  validates :texto, presence: true
end
