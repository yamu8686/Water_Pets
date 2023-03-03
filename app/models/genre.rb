class Genre < ApplicationRecord
  has_many :creatures, dependent: :destroy
  validates :name, presence: true
  validates :color, presence: true
end
