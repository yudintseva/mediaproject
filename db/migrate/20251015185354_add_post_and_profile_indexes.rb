class AddPostAndProfileIndexes < ActiveRecord::Migration[7.2]
  def change
    # posts
    add_index :posts, :slug, unique: true  if column_exists?(:posts, :slug)        && !index_exists?(:posts, :slug, unique: true)
    add_index :posts, :user_id             if column_exists?(:posts, :user_id)     && !index_exists?(:posts, :user_id)
    add_index :posts, :category_id         if column_exists?(:posts, :category_id) && !index_exists?(:posts, :category_id)
    add_index :posts, :status              if column_exists?(:posts, :status)      && !index_exists?(:posts, :status)
    add_index :posts, :published_at        if column_exists?(:posts, :published_at)&& !index_exists?(:posts, :published_at)

    # profiles 1:1
    add_index :profiles, :user_id, unique: true unless index_exists?(:profiles, :user_id)
  end
end
