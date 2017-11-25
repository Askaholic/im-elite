class Organization < ApplicationRecord
  has_many :teams
  has_many :players
end
