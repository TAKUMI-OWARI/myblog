class RemoveIndexToNewsweeks < ActiveRecord::Migration[5.2]
  def change
    remove_index :newsweeks, :image
    remove_index :newsweeks, :url
  end
end
