class Product < ApplicationRecord
  validates :title, presence: { :message => :title_blank }
  validates :price, presence: true
  validates :description, presence: true
  validates_length_of :description, :in => 10..2000
  has_one_attached :main_photo
  validates :main_photo, presence: true, blob: { content_type: ['image/jpg', 'image/jpeg', 'image/png'], size_range: 0..50.megabytes }
  #validate :main_photo?
  belongs_to :category
  belongs_to :maker
  belongs_to :shop
  has_many :fields, foreign_key: "product_id", class_name: "Attribute", dependent: :destroy

  #def main_photo?
   # if !self.main_photo.attached?
    #  errors.add(:base, "not attached");
   # end
  #end

end
