class Post < ApplicationRecord
  has_many_attached :images
  validates :images, blob: { content_type: ['image/jpg', 'image/jpeg', 'image/png']}
  belongs_to :user
  validates :mark, :presence => true
  validates :mark, :inclusion => 0..5
  validates_length_of :body, :in => 10..2000
end
