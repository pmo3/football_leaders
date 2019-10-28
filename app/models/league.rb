class League < ApplicationRecord
  validates :country, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true
  validates :lat, presence: true
  validates :lng, presence: true
  has_many :rankings
  scope :by_country, -> { all.group_by(&:country) }
  attr_accessor :api_id

  def league_leader
    rankings.league_leader
  end

  def current_standings
    rankings.current
  end
end
