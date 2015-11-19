##
# Migration DB: update table Item add column image
class AddImageToItem < ActiveRecord::Migration
  def change
    add_column :items, :image, :string
  end
end
