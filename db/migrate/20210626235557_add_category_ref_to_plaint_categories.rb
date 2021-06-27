class AddCategoryRefToPlaintCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :plaint_categories, :category, foreign_key: true
  end
end
