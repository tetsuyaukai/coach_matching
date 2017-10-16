class RemoveColumnScheduledAtFromContentsTable4 < ActiveRecord::Migration[5.1]
  def change
    add_column :contents, :scheduled_date, :date
    add_column :contents, :scheduled_time, :time
  end
end
