class AddIndexToNewsweeks < ActiveRecord::Migration[5.2]
  def change
    add_index :newsweeks, :title, unique: true
  end
end
