class Category < ApplicationRecord
    has_many :products
    has_ancestry
    has_and_belongs_to_many :makers, ->{ order('name ASC') }
    belongs_to :nav_category, optional: true
    def self.add title, hash
      data = JSON.generate(hash)
      self.where(name: title, data: data, is_template: true ).first_or_create
    end
end
