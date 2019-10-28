class Ranking < ApplicationRecord
  belongs_to :team
  belongs_to :league
  validates :rank, presence: true
  validates :date, presence: true
  validates :points, presence: true

  scope :league_leader, -> { current.where(rank: 1).first }

  def self.current
    records = where(date: Date.current)
    if records.present?
      records
    else
      # if rankings haven't been updated for some reason, find latest date
      date = all.order("date DESC").first.try(:date)
      where(date: date)
    end
  end
end
