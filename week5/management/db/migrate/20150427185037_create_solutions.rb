class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.string :content
      t.timestamps null: false
    end
  end
end
