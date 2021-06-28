class AddUserRefToPunctualities < ActiveRecord::Migration[5.2]
  def change
    add_reference :punctualities, :user, foreign_key: true
  end
end
