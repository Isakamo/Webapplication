class Board < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, uniqueness: true, length: { minimum: 1 }, length: { maximum: 10 }
  validates :is_delete, inclusion: { in: [true, false] }
end
