class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :recommendeds
         has_many :reviews
         has_many :likes, dependent: :destroy
         has_many :like_recommendeds, through: :likes, source: :recommended
         has_many :recommendeds, dependent: :destroy
         has_many :comments, dependent: :destroy
         has_many :clips, dependent: :destroy #この行を追記することで関連付くイベントが削除されるとclipも削除されます。
         has_many :recommendeds, through: :clips
end
