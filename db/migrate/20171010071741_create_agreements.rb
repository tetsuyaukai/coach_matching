class CreateAgreements < ActiveRecord::Migration[5.1]
  def change
    create_table :agreements do |t|
      t.integer :content_id, index: true
      t.integer :user_id, index: true
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
