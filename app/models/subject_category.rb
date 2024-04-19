class SubjectCategory < ApplicationRecord
  has_many :posts, dependent: :nullify
end
