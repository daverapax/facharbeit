class RemoveBioFromAuthor < ActiveRecord::Migration
  def change
    remove_column :authors, :bio, :text
  end
end
