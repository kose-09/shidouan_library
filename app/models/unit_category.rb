class UnitCategory < ApplicationRecord
  belongs_to :subject_category
  has_many :posts, dependent: :nullify
end
