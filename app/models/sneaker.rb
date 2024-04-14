class Sneaker < ApplicationRecord
  has_one_attached :image

  has_many :line_items, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
