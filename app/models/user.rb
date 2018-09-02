class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable
#         :lockable, :timeoutable, :omniauthable

  # added below by namura
  validates :name, uniqueness: true, length: { minimum: 1 ,maximum: 10}
  validates :admin, inclusion: { in: [true, false] }
  validates :is_delete, inclusion: { in: [true, false] }

  #def email_required?
  #  false
  #end

end
