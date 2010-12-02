class AddCategoryIdToHousings < ActiveRecord::Migration
  def self.up
    add_column :housings, :category_id, :integer
  end

  def self.down
    remove_column :housings, :category_id
  end
end
