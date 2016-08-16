class Trip < ApplicationRecord
  has_many :transportations
  has_and_belongs_to_many :users
end
