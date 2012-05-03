class AddToUser < ActiveRecord::Migration
   def change
    add_column :users, :address, :string
    add_column :users, :age, :integer
    add_column :users, :birthday, :string
  end
end
