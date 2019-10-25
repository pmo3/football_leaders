class Ranking < ApplicationRecord
  belongs_to :team
  belongs_to :league
  validates :rank, presence: true
  validates :date, presence: true
  validates :points, presence: true

  scope :league_leader, -> { where(rank: 1).order("date DESC").first }
end
