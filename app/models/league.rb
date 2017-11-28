class League < ApplicationRecord
  belongs_to :season
  has_many :teams, dependent: :destroy
  has_many :games, dependent: :destroy

  def identifier
    self.sport + " (" + self.l_type + ")"
  end
end
