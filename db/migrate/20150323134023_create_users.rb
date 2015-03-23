class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.integer :story_id
      t.integer :comment_id

      t.timestamps null: false
    end
  end
end
