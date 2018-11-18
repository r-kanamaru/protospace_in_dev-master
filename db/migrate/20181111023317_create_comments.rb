class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :nickname
      t.text :comment
      t.integer :prototype_id
      t.timestamps
    end
  end
end
