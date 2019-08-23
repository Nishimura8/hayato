class Recommended < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :user
    mount_uploader :image, ImageUploader
    has_many :reviews
    has_many :likes, dependent: :destroy
    has_many :liking_users, through: :likes, source: :user
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :clips
    has_many :users, through: :clips
    belongs_to_active_hash :category
end
