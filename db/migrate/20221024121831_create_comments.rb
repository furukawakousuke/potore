class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :poster_id
      t.integer :post_photo_id
      t.text :text

      t.timestamps
    end
  end
end
