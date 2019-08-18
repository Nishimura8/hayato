class Recommended < ApplicationRecord
    belongs_to :user
    mount_uploader :image, ImageUploader
    has_many :reviews
    has_many :likes, dependent: :destroy
    has_many :liking_users, through: :likes, source: :user
end
