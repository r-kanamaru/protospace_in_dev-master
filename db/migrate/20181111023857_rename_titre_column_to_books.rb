class RenameTitreColumnToBooks < ActiveRecord::Migration
  def change
    rename_column :comments, :review, :comment
  end
end
