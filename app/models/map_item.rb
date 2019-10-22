class MapItem < ApplicationRecord
  belongs_to :country
  validates :size, presence: true
end
