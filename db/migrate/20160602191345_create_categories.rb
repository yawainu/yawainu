class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.boolean :app_flag, default: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
