class CreatePunctualities < ActiveRecord::Migration[5.2]
  def change
    create_table :punctualities do |t|
      t.date :date
      t.time :arrival_time
      t.time :departure_time

      t.timestamps
    end
  end
end
