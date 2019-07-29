class AddIndex2ToNewsweeks < ActiveRecord::Migration[5.2]
  def change
    add_index :newsweeks, :image, unique: true
    add_index :newsweeks, :url, unique: true
  end
end
