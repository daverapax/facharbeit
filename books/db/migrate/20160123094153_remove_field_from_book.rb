class RemoveFieldFromBook < ActiveRecord::Migration
  def change
    remove_column :books, :rating, :integer
  end
end
