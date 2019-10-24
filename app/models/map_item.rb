class MapItem < ApplicationRecord
  belongs_to :league
  validates :size, presence: true
end
