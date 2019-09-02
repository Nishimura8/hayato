class Recommended < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :user
    has_one_attached :image
    has_many :reviews
    has_many :likes, dependent: :destroy
    has_many :liking_users, through: :likes, source: :user
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :clips
    has_many :users, through: :clips
    belongs_to_active_hash :category

    def self.search(search)
        return Recommended.all unless search
        Recommended.where(['title LIKE ?', "%#{search}%"])
      end
end
