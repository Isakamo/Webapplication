class UpFile < ApplicationRecord
  belongs_to :thre
  belongs_to :user
  belongs_to :response, optional:true

  validates :format, presence: true, length: { minimum: 1 }, length: { maximum: 10 }
  validates :is_delete, inclusion: { in: [true, false] }
  #mount_uploader :format, UpFileUploader
end
