class RemoveColumnScheduledAtFromContentsTable3 < ActiveRecord::Migration[5.1]
  def change
    remove_column :contents, :scheduled_at, :datetime
  end
end
