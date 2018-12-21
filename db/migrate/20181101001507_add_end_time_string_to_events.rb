class AddEndTimeStringToEvents < ActiveRecord::Migration
  def change
    add_column :events, :end_time_string, :string
  end
end
