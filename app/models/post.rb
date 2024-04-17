class Post < ApplicationRecord
  belongs_to :user
  belongs_to :unit_category, optional: true

  has_one_attached :shidouan_pdf
end
