class User < ApplicationRecord
  has_and_belongs_to_many :trips
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
end
