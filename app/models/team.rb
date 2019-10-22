class Team < ApplicationRecord
  validates :name, presence: true
  validates :logo_url, presence: true
end
