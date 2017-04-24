# Requests Migrations
class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.references :book
      t.references :user
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
