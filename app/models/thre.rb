class Thre < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :board

  validates :name, presence: true, length: { minimum: 1 }, length: { maximum: 50 }
  validates :is_delete, inclusion: { in: [true, false] }
end
