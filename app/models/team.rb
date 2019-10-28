class Team < ApplicationRecord
  validates :name, presence: true
  validates :logo_url, presence: true
  belongs_to :league
  before_save :ensure_hex

  private

  def ensure_hex
    if self.color.present? && self.color[0,1] != "#"
      self.color = "#" + self.color
    end
  end
end
