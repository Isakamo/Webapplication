class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable, :omniauthable

  # added below by namura
  validates :name, uniqueness: true, length: { minimum: 1 }, length: { maximum: 10 }
  validates :password, uniqueness: true, length: { minimum: 8 }, length: { maximum: 16 }
  validates :is_delete, inclusion: { in: [true, false] }

end
