class AddRosterToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :roster, index: true, foreign_key: true
  end
end
