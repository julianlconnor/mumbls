class AddPriceToListings < ActiveRecord::Migration
  def self.up
    add_column :listings, :price, :integer
  end

  def self.down
    remove_column :listings, :price
  end
end
