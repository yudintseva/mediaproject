class AddSlugToPosts < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :slug, :string
  end
end
