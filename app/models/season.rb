class Season < ApplicationRecord
  belongs_to :organization
  has_many :leagues, dependent: :destroy

  def identifier
    self.start_date.strftime("%b %-d, %Y") + " - " + self.end_date.strftime("%b %-d, %Y")
  end
end
