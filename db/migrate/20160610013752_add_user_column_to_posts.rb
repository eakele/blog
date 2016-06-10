class AddUserColumnToPosts < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.references :user
    end
    change_table :comments do |t|
      t.references :user
    end
  end
end
