class Bug < ApplicationRecord
  mount_uploader :screenshot, ScreenshotUploader

  belongs_to :project
  belongs_to :developer, class_name: :User, foreign_key: :developer_id, optional:true
  belongs_to :qa, class_name: :User, foreign_key: :qa_id

  validates :title, presence: true, length: {minimum: 5, maximum: 40}
end
