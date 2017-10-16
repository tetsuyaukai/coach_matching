class AddMenuColumnToContents < ActiveRecord::Migration[5.1]
  def change
    add_column :contents, :menu, :text
  end
end
