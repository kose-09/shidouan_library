class Post < ApplicationRecord
  belongs_to :user
  belongs_to :subject_category, optional: true
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  has_one_attached :shidouan_pdf

  validates :title, presence: true
  validates :title, length: { maximum: 50 }
  validates :shidouan_pdf, presence: true
  validates :subject_category, presence: true
  
  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)} 

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.search(search, subject_category_id)
    if search.present? && subject_category_id.present?
      Post.where('(title LIKE ? OR caption LIKE ?) AND subject_category_id = ?', "%#{search}%","%#{search}%", subject_category_id)
    elsif search.present?
      Post.where('title LIKE ? OR caption LIKE ?', "%#{search}%", "%#{search}%")
    elsif subject_category_id.present?
      Post.where(subject_category_id: subject_category_id)
    else
      Post.all
    end
  end
end
