class Product < ActiveRecord::Base
  belongs_to :brands
  has_many :categories, through: :categories_products
end
