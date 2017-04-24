# Edit Author Migration
class EditAuthorFromBook < ActiveRecord::Migration[5.0]
  def change
    remove_column :books, :author
    add_reference :books, :author, foreign_key: true
  end
end
