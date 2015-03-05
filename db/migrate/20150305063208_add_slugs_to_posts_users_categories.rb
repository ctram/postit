class AddSlugsToPostsUsersCategories < ActiveRecord::Migration
  def change
    add_column :posts, :slugs, :string
    add_column :users, :slugs, :string
    add_column :categories, :slugs, :string
  end
end
