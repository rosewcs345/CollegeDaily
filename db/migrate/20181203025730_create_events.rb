class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :category
      t.string :host
      t.string :location
      t.text :description
      t.date :date
      t.time :start_time
      t.time :end_time
      t.text :traits
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
