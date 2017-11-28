class Game < ApplicationRecord
  belongs_to :team_1, class_name: 'Team'
  belongs_to :team_2, class_name: 'Team'
  belongs_to :team_winner, class_name: 'Team', optional: true

  validates :date, presence: true

  def identifier
    self.team_1.name + " vs " + self.team_2.name
  end
end
