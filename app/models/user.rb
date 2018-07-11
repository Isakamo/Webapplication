class User < ApplicationRecord
  validates :name, uniqueness: true, length: { minimum: 1 }, length: { maximum: 10 }
  validates :password, uniqueness: true, length: { minimum: 8 }, length: { maximum: 16 }
  validates :is_delete, inclusion: { in: [true, false] }
end
