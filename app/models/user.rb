class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :recommendeds
         has_many :reviews
         has_many :likes, dependent: :destroy
         has_many :like_recommendeds, through: :likes, source: :recommended
end
