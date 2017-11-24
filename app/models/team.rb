class Team < ApplicationRecord
  has_many :players
  validates :name, presence: true,
                    length: { minimum: 5}
end
