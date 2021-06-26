class CreatePlaints < ActiveRecord::Migration[5.2]
  def change
    create_table :plaints do |t|
      t.string :title
      t.string :description
      t.string :remarks

      t.timestamps
    end
  end
end
