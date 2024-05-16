class SubjectCategory < ApplicationRecord
  has_many :posts, dependent: :nullify
  validates :name, presence: true
  validates :name, length: { maximum: 10 }
end
