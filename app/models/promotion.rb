class Promotion < ApplicationRecord
	has_many :artist_works
    has_many :users, through: :artist_works

	mount_uploader :artwork, PromotionUploader

	validates :artwork, :title, presence: true
end