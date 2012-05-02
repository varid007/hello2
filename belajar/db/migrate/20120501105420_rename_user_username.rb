class RenameUserUsername < ActiveRecord::Migration
  def up
    rename_column :users, :user_name, :username
    
  end

  def down
      rename_column :users, :user_name, :user_name
  end
end
