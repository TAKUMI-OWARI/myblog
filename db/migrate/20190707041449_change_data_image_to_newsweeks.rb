class ChangeDataImageToNewsweeks < ActiveRecord::Migration[5.2]
  def change
    change_column :newsweeks, :image, :text
  end
end
