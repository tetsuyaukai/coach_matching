class CreateContents < ActiveRecord::Migration[5.1]
  def change
      create_table :contents do |t|
      t.integer :place_id, index: true
      t.integer :user_id, index: true
      t.datetime :scheduled_at

      t.timestamps
    end
  end
end
