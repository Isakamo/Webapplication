class Response < ApplicationRecord
  belongs_to :thre
  belongs_to :user
  belongs_to :response
  belongs_to :up_file

  validates :content, presence: true, length: { minimum: 1 }, length: { maximum: 1024 }
  validates :is_delete, inclusion: { in: [true, false] }
end
