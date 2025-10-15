class AddConstraintsAndIndexes < ActiveRecord::Migration[7.2]
  def change
    # users
    add_index :users, :email, unique: true unless index_exists?(:users, :email, unique: true)
    change_column_default :users, :role, from: nil, to: 0 if column_exists?(:users, :role)

    # profiles (1:1)
    add_index :profiles, :user_id, unique: true unless index_exists?(:profiles, :user_id)
    change_column_default :profiles, :anonymous, from: nil, to: false if column_exists?(:profiles, :anonymous)

    # categories
  add_index :categories, :name, unique: true unless index_exists?(:categories, :name, unique: true)
if column_exists?(:categories, :slug)
  add_index :categories, :slug, unique: true unless index_exists?(:categories, :slug, unique: true)
end
    # posts
if column_exists?(:posts, :slug)
  add_index :posts, :slug, unique: true unless index_exists?(:posts, :slug, unique: true)
end
add_index :posts, :user_id      if column_exists?(:posts, :user_id)      && !index_exists?(:posts, :user_id)
add_index :posts, :category_id  if column_exists?(:posts, :category_id)  && !index_exists?(:posts, :category_id)
add_index :posts, :status       if column_exists?(:posts, :status)       && !index_exists?(:posts, :status)
add_index :posts, :published_at if column_exists?(:posts, :published_at) && !index_exists?(:posts, :published_at)

    # attachments
    add_index :attachments, :post_id unless index_exists?(:attachments, :post_id)

    # comments
    add_index :comments, :user_id unless index_exists?(:comments, :user_id)
    add_index :comments, :post_id unless index_exists?(:comments, :post_id)
    add_index :comments, :parent_id unless index_exists?(:comments, :parent_id)
    change_column_default :comments, :status, from: nil, to: 0 if column_exists?(:comments, :status)

    # likes
    add_index :likes, [:user_id, :post_id], unique: true unless index_exists?(:likes, [:user_id, :post_id], unique: true)

    # subscriptions
    add_index :subscriptions, :email, unique: true unless index_exists?(:subscriptions, :email, unique: true)
  end
end
