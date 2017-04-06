class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :name
      t.integer :rate
      t.string :description
      t.references :book
      t.timestamps
    end
  end
end
