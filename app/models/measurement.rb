class Measurement < ApplicationRecord
  validates :name, :abbreviation, presence: true
  validates :name, length: { maximum: 16 }
  validates :abbreviation, length: { maximum: 8 }
end
