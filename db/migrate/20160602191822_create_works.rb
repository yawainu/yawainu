class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.date :start_date
      t.date :end_date
      t.string :comment
      t.boolean :app_flag, default: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
