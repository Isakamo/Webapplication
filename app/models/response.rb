class Response < ApplicationRecord
  belongs_to :thre
  belongs_to :user, optional:true
  belongs_to :response, optional:true
  belongs_to :up_file, optional:true

  #has_one :up_file
  #accepts_nested_attributes_for :up_file

  validates :content, presence: true, length: { minimum: 1 }, length: { maximum: 1024 }
  validates :is_delete, inclusion: { in: [true, false] }
  #mount_uploader :up_file_id, UpFileUploader
end
