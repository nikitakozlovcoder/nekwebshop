class OrderedProduct < ApplicationRecord
  has_one_attached :main_photo
  belongs_to :order
  belongs_to :product

  def data_view
    data = JSON.parse(self.data)
    str=""
    data.each do |d|
      str+="#{d['name']}#{d['hint'].blank? ? '' : '('+d['hint']+')' }:  #{d['value']}. " if d
    end
    str
  end
end
