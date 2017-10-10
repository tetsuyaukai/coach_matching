class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :gender
      t.date :birthday
      t.string :email, index: true
      t.text :profile

      t.timestamps
    end
  end
end
