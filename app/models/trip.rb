class Trip < ApplicationRecord
  has_many :transportations, dependent: :destroy
  has_and_belongs_to_many :users
end
