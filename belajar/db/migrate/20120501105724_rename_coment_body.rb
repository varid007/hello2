class RenameComentBody < ActiveRecord::Migration
  def up
    rename_column :comments, :body, :content
  end

  def down
    rename_column :comments, :body, :body
  end
end
