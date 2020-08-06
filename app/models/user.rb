class User < ApplicationRecord
    has_many :carts
    attr_accessor :skip_pass
    has_one_attached :avatar
    has_many :posts
    has_secure_password
    validates_uniqueness_of :email
    validates :email, presence: true
    validates :name, presence: true
    validates :surname, presence: true
    validates_uniqueness_of :phone, :allow_nil => true
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

    validates :password, confirmation: { case_sensitive: true }, unless: :skip_pass
   # validates :password, presence: true
    validates_length_of  :password, in: 8..50, unless: :skip_pass
end

