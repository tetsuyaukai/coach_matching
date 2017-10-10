class CreateUsersSports < ActiveRecord::Migration[5.1]
  def change
    create_table :users_sports do |t|
      t.integer :user_id, index: true
      t.integer :sport_id, index: true

      t.timestamps
    end
  end
end
