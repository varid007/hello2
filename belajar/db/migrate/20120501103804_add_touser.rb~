class AddTouser < ActiveRecord::Migration
  def up
    add_column :users, :address, :string
    add_column :users, :age, :integer
    add_column :users, :birthday, :string
  end
  def down
    remove_column :users, :address, :string
    remove_column :users, :age, :integer
    remove_column :users, :birthday, :string
  
  end
end
