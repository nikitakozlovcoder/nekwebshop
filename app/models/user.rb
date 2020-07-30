class User < ApplicationRecord
    has_secure_password
    validates_uniqueness_of :email
    validates :email, presence: true
    validates_uniqueness_of :phone
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

    validates :password, confirmation: { case_sensitive: true }
   # validates :password, presence: true
    validates_length_of  :password, in: 8..50
end
