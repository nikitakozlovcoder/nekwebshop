class Category < ApplicationRecord
    has_many :products
    has_ancestry
    has_and_belongs_to_many :makers, ->{ order('name ASC') }
    belongs_to :nav_category, optional: true
    def self.add title, hash
      hash.insert 0, {:name=>"Изображения", :type=>"Images", :id=>1, :min=>nil, :max=>nil, hint: nil}
      hash.each_with_index do |el, idx|
        el[:id] = idx+1;
      end
      data = JSON.generate(hash)
      pp hash
      self.where(name: title, data: data, is_template: true ).first_or_create
    end
end
