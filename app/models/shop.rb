class Shop < ApplicationRecord
  has_many :products
  has_many :orders
  has_many :posts, through: :products
  has_many :categories, through: :products
  #belongs_to :user
  def mark
    if self.products.count == 0
       0.0
    else
       self.posts.average(:mark).to_f
    end
  end

  def update_top_cat
    temp = [Category.roots.where(is_template: true), Category.roots.map(&:children)].flatten!.filter{|a| self.products.where(category_id: a.subtree).count != 0}
    # temp = self.categories.map{|a|
    #       t = a.parent
    #       if !t.nil?
    #         t
    #       else
    #         a
    #       end
    #     }.uniq!)
    data = (temp  ? temp :  []).sort_by{|a| self.products.where(category_id: a.subtree).count }.reverse![0..3]
    self.top_cat = JSON.generate data.map{|a| a.id}
    self.save
  end
  def update_top_cat_on_add product
    #cat = product.category.parent ? product.category.parent  : product.category
    cat = get_cat product.category
    arr = JSON.parse self.top_cat
    arr << cat.id if !arr.include? cat.id
    arr = arr.sort_by{|a| self.products.where(category_id: Category.find(a).subtree).count}.reverse!
    self.top_cat = JSON.generate arr[0..3]
    self.save
  end
  private
  def get_cat category
      if category.parent.nil? || category.parent.parent.nil?
        return category
      end
    return get_cat category.parent
  end
end
