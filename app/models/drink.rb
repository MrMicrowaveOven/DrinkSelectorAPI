class Drink < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :ingredients, presence: true
end
