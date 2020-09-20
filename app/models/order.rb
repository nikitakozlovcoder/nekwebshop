class Order < ApplicationRecord
  belongs_to :shop
  has_one :address, dependent: :delete
  belongs_to :user, optional: true
  has_many :ordered_products, dependent: :delete_all
  has_many :products, through: :ordered_products

  def price
    total_price = 0
    self.ordered_products.each do |op|
      total_price += op.price * op.quantity
    end
    total_price
  end
end
