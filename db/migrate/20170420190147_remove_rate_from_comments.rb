# Remove Rate from Comments Migration
class RemoveRateFromComments < ActiveRecord::Migration[5.0]
  def change
    remove_column :comments, :rate
  end
end
