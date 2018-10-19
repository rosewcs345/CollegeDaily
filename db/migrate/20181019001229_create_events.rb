class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :host
      t.date :date
      t.time :start_time
      t.time :end_time
      t.string :location
      t.text :description

      t.timestamps null: false
    end
  end
end
