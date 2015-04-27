class CreateBrandsCategories < ActiveRecord::Migration
  def change
    create_table :brands_categories do |t|
      t.belongs_to :brands, index: true
      t.belongs_to :categories, index: true

      t.timestamps null: false
    end
  end
end
