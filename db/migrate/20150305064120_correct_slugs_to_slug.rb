class CorrectSlugsToSlug < ActiveRecord::Migration
  def change
    rename_column :posts, :slugs, :slug
    rename_column :users, :slugs, :slug
    rename_column :categories, :slugs, :slug
  end
end
