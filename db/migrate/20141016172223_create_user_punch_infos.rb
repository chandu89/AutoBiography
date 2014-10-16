class CreateUserPunchInfos < ActiveRecord::Migration
  def change
    create_table :user_punch_infos do |t|
      t.integer :user_id
      t.text :punch_text

      t.timestamps
    end
  end
end
