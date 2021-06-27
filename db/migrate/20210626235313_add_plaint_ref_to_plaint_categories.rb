class AddPlaintRefToPlaintCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :plaint_categories, :plaint, foreign_key: true
  end
end
