class Team < ApplicationRecord
  belongs_to :league
  has_many :players
  validates :name, presence: true,
                    length: { minimum: 5}
end
