class CreateCovers < ActiveRecord::Migration
  def change
    create_table :covers do |t|
      t.boolean :app_flag
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
