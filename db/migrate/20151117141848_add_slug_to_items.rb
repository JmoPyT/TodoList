##
# Migration DB: add slug to table Item
class AddSlugToItems < ActiveRecord::Migration # rails generate migration AddSlugToItems slug:string:uniq
  def change
    add_column :items, :slug, :string
    add_index :items, :slug, unique: true
  end
end
