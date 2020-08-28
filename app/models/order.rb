class Order < ApplicationRecord
  belongs_to :shop
  has_one :address, dependent: :destroy
  belongs_to :user, optional: true
  has_many :ordered_products, dependent: :destroy
  has_many :products, through: :ordered_products
end
