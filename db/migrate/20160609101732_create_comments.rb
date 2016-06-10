class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :post
      t.string :content
      t.boolean :like
      t.timestamps null: false
    end
  end
end
