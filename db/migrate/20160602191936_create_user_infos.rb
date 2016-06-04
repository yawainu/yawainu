class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.string :title,      default: 'site title'
      t.text   :comment
      t.string :main_color, default: '#212121'
      t.string :sub_color,  default: '#212121'
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
