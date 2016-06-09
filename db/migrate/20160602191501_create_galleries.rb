class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :title
      t.boolean :app_flag, default: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
