class League < ApplicationRecord
  belongs_to :season
  has_many :teams, dependent: :destroy

  def identifier
    self.sport + " (" + self.l_type + ")"
  end
end
