class Cart < ApplicationRecord
  belongs_to :product
  belongs_to :user, optional: true
  validates :quantity, :numericality => { :greater_than_or_equal_to => 0 }
end
