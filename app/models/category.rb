class Category < ApplicationRecord
    has_many :products
    has_and_belongs_to_many :makers

    def self.add title, hash
      data = JSON.generate(hash)
      self.where(name: title, data: data ).first_or_create
    end
end
