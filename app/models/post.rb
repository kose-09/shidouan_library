class Post < ApplicationRecord
  belongs_to :user
  belongs_to :subject_category, optional: true

  has_one_attached :shidouan_pdf
end
