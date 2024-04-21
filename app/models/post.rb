class Post < ApplicationRecord
  belongs_to :user
  belongs_to :subject_category, optional: true
  has_many :favorites, dependent: :destroy

  has_one_attached :shidouan_pdf

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
