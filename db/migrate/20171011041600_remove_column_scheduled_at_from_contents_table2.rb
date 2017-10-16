class RemoveColumnScheduledAtFromContentsTable2 < ActiveRecord::Migration[5.1]
  def up
    remove_column :contents, :datetime
  end

  def down
    add_column :contents, :scheduled_date, :date
    add_column :contents, :scheduled_time, :time
  end
end
