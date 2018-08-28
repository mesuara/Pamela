class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :instructors
  has_many :students
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable nd :omniauthable

end
