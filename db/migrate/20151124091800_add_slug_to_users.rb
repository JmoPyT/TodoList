class AddSlugToUsers < ActiveRecord::Migration # rails generate migration AddSlugToUsers slug:string:uniq
  def change
    add_column :users, :slug, :string
    add_index :users, :slug, unique: true
  end
end
