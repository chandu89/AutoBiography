class CreateAutobios < ActiveRecord::Migration
  def change
    create_table :autobios do |t|
      t.integer :user_id
      t.text :about
      t.string :heading

      t.timestamps
    end
  end
end
