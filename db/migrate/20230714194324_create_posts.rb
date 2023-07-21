class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :post_name
      t.string :introduction
      t.integer :user_id
      t.integer :post_id
      t.integer :comment_id


      t.timestamps
    end
  end
end
