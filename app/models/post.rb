class Post < ApplicationRecord
  belongs_to :user
  
  has_one_attached :shidouan_pdf
end
