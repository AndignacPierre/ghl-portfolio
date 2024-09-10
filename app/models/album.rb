class Album < ApplicationRecord
  has_and_belongs_to_many :photos

  # Validations (optionnelles)
  validates :title, presence: true
end
