class DropTagsAndTaggings < ActiveRecord::Migration[7.2]
  def change
    drop_table :taggings, if_exists: true
    drop_table :tags,     if_exists: true
  end
end
