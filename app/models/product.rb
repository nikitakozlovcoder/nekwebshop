class Product < ApplicationRecord
  has_one_attached :main_photo
  belongs_to :category
end
