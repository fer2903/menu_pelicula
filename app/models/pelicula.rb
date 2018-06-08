class Pelicula < ApplicationRecord
	belongs_to :likes
	belongs_to :category
	belongs_to :users
    mount_uploader :image, ImageUploader


end
