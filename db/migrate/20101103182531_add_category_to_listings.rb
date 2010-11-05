class AddCategoryToListings < ActiveRecord::Migration
  def self.up
    add_column :listings, :category_id, :integer
  end

  def self.down
    remove_column :listings, :category_id
  end
end
