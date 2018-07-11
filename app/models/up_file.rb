class UpFile < ApplicationRecord
  belongs_to :thre
  belongs_to :user

  validates :format, presence: true, length: { minimum: 1 }, length: { maximum: 10 }
  validates :is_delete, inclusion: { in: [true, false] }
end
