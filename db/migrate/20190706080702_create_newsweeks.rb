class CreateNewsweeks < ActiveRecord::Migration[5.2]
  def change
    create_table :newsweeks do |t|
      t.string :title, index: true
      t.string :image
      t.text   :url
      t.timestamps
    end
  end
end
