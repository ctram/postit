class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string  :url
      t.string  :title
      t.text    :text
      t.integer :user_id 
    end
  end
end
