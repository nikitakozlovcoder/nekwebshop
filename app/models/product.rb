class Product < ApplicationRecord
  validates :title, presence: { :message => :title_blank }
  has_one_attached :main_photo
  belongs_to :category
  belongs_to :maker
end
