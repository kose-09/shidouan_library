class SubjectCategory < ApplicationRecord
  has_many :posts, dependent: :destroy
  validates :name, presence: true
  validates :name, length: { maximum: 10 }
  validates :name, uniqueness: true
end
