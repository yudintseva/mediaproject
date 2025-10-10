class RemoveUserForeignKeyFromPosts < ActiveRecord::Migration[8.0]
  def change
    # Удаляем foreign key constraint
    remove_foreign_key :posts, :users
    
    # Удаляем колонку user_id
    remove_column :posts, :user_id
  end
end
