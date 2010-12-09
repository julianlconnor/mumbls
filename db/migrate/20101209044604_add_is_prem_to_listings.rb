class AddIsPremToListings < ActiveRecord::Migration
  def self.up
    add_column :listings, :is_prem, :boolean, :default => false
  end

  def self.down
    remove_column :listings, :is_prem
  end
end
