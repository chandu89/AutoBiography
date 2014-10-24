class CreateAbouts < ActiveRecord::Migration
  def change
    create_table :abouts do |t|
      t.string :first_name
      t.string :last_name
      t.date :DOB
      t.string :gender

      t.timestamps
    end
  end
end
