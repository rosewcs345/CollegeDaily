class AddStartTimeStringToEvents < ActiveRecord::Migration
  def change
    add_column :events, :start_time_string, :string
  end
end
