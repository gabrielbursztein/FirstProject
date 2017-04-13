class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :rate
      t.references :user
      t.string :description
      t.references :book
      t.timestamps
    end
  end
end
