class ChangeDataImageUrlToNewsweeks < ActiveRecord::Migration[5.2]
  def change
    change_column :newsweeks, :image, :string
    change_column :newsweeks, :url, :string
  end
end
