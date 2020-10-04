class OrderedProduct < ApplicationRecord
  has_one_attached :main_photo
  belongs_to :order
  belongs_to :product

  def data_view
    data = JSON.parse(self.data)
    str=""
    data.each do |d|
      val = d['value']
      val = val[0..20] if val.is_a? String
      str+="#{d['name']}#{d['hint'].blank? ? '' : '('+d['hint']+')' }:  #{val}. " if d
    end
    str
  end
end
