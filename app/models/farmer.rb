class Farmer < ApplicationRecord

  # A farmer belongs to one user
  belongs_to :user

  # Farmer fields validator
  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true

end
