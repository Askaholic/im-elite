class Organization < ApplicationRecord
  has_many :seasons, dependent: :destroy
  has_many :players, dependent: :destroy
end
