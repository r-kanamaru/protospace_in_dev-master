class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :nickname
      t.text :review
      t.integer :prototype_id
      t.timestamps null: false
    end
  end
end
