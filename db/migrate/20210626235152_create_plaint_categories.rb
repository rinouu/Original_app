class CreatePlaintCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :plaint_categories do |t|

      t.timestamps
    end
  end
end
