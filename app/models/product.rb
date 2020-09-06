class Product < ApplicationRecord

  has_many :posts, dependent: :delete_all
  has_many :carts, dependent: :delete_all
  has_many :wishes, dependent: :delete_all
  validates :title, presence: { :message => :title_blank }
  validates :quantity, :numericality => { :greater_than_or_equal_to => 0 }
  validates_length_of :title, :in => 5..50
  validates :price, presence: true
  validates :price,:numericality => { :greater_than_or_equal_to => 0 }
  validates :description, presence: true
  validates_length_of :description, :in => 10..2000
  has_one_attached :main_photo
  validates :main_photo, presence: true, blob: { content_type: ['image/jpg', 'image/jpeg', 'image/png'], size_range: 0..50.megabytes }
  #validate :main_photo?
  belongs_to :category
  belongs_to :maker
  belongs_to :shop
  has_many :fields, foreign_key: "product_id", class_name: "Attribute", dependent: :delete_all
  has_many :ordered_products, dependent: :destroy
  has_many :orders, through: :ordered_products
  #def main_photo?
   # if !self.main_photo.attached?
    #  errors.add(:base, "not attached");
   # end
  #end
  def recalc_mark

    if self.posts.count == 0
      self.mark = 0.0
    else
      self.mark =  self.posts.average(:mark).to_f
    end
    self.save
  end

end
