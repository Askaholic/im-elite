class Player < ApplicationRecord
  belongs_to :team, optional: true
  belongs_to :organization

  def identifier
    self.first_name + " " + self.last_name
  end
end
