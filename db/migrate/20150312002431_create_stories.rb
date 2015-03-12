class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.text :story
      t.integer :user

      t.timestamps null: false
    end
  end
end
