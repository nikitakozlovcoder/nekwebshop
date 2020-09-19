class User < ApplicationRecord
    has_many :shops
    has_many :carts
    has_many :wishes
    has_many :orders
    attr_accessor :skip_pass, :should_validate_temp_mail
    has_one_attached :avatar
    has_many :posts, :dependent => :delete_all
    has_secure_password
    #validates_uniqueness_of :email
    validates :email, presence: true
    validates :name, presence: true
    validates :surname, presence: true
    #validates :third_name, presence: true
    validates_uniqueness_of :phone, :allow_nil => true
    validates_format_of :phone, :with => /\+?[0-9]+/, :allow_nil => true
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

    validates_format_of :email_temp, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, if: :should_validate_temp_mail

    validates :password, confirmation: { case_sensitive: true }, unless: :skip_pass
   # validates :password, presence: true
    validates_length_of  :password, in: 8..50, unless: :skip_pass

    def location
       location = [self.street, self.city, self.state, self.country ]

       location.any?{|a| a.nil? or a.blank? } ? '' : location.join(', ')
    end
end

