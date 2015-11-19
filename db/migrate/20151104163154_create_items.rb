##
# Migration DB: create table Item
class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :titre
      t.text :contenu

      t.timestamps null: false
    end
  end
end
