class AddResolvedToPlaints < ActiveRecord::Migration[5.2]
  def change
    add_column :plaints, :resolved, :boolean, default: false
  end
end
