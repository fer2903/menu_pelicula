class Pelicula < ApplicationRecord
	has_many :likes
	belongs_to :category
	mount_uploader :image, ImageUploader


end
