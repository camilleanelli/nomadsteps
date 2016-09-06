class Ticket < ApplicationRecord
  belongs_to :transportation, dependent: :destroy
end
