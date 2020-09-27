class Address < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :shop, optional: true
  def location
    location = [self.street, self.city, self.state, self.country ]

    location.any?{|a| a.nil? or a.blank? } ? '' : location.join(', ')
  end
end
