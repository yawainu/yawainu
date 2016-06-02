class CreateDisplays < ActiveRecord::Migration
  def change
    create_table :displays do |t|
      t.boolean :cover
      t.boolean :gallery
      t.boolean :work
      t.boolean :contact
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
