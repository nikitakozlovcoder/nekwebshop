class Address < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :shop, optional: true
end
