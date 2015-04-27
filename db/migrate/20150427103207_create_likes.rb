class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :value
      t.references :user, polymorphic: true, index: true
      t.references :story, polymorphic: true, index: true

      t.timestamps null: false
    end
    add_column :users, :like_id, :integer
    add_column :stories, :like_id, :integer
  end
end
