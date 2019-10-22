class Country < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :top_league, presence: true
  validates :lat, presence: true
  validates :lng, presence: true
end
