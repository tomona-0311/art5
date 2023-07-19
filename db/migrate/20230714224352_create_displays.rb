class CreateDisplays < ActiveRecord::Migration[6.1]
  def change
    create_table :displays do |t|
      t.string :comment
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
  end
end
