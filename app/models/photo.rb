class Photo < ApplicationRecord
  # Active Storage pour l'upload d'images
  has_one_attached :image

  # Relation avec les albums
  has_and_belongs_to_many :albums

  # Validations
  validates :title, presence: true
  validates :image, presence: true
  validates :category, inclusion: { in: %w[pro perso] }

  mount_uploader :image, CloudinaryUploader
end
