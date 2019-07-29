class AddDetailsToNewsweeks < ActiveRecord::Migration[5.2]
  def change
    add_column :newsweeks, :category, :string
    add_column :newsweeks, :date, :string
  end
end
