class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.text :comment
      t.string :main_color
      t.string :sub_color
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
