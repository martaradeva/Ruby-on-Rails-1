class Category < ActiveRecord::Base
  has_many :products, through: :categories_products
  has_many :brands, through: :brands_categories
end
