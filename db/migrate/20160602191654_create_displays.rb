class CreateDisplays < ActiveRecord::Migration
  def change
    create_table :displays do |t|
      t.boolean :cover,   default: false
      t.boolean :gallery, default: false
      t.boolean :work,    default: false
      t.boolean :contact, default: false
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
