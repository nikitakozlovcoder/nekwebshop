class OrderedProduct < ApplicationRecord
  has_one_attached :main_photo
  belongs_to :order
  belongs_to :product
end
