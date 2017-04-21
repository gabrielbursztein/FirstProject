class AddNameToUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :name
    add_column :users, :name, :string, null: false, default: ""
  end
end
