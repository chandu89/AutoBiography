class AddNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :Mobile, :integer
    add_column :users, :Birthday, :date
    add_column :users, :gender, :string
  end
end
