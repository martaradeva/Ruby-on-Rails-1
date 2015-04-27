class Brand < ActiveRecord::Base
  has_many :categories, through: :brands_categories
  has_many :products
end
