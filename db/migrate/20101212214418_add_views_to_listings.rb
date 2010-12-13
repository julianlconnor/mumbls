class AddViewsToListings < ActiveRecord::Migration
  def self.up
    add_column :listings, :views, :integer, :default => 0
  end

  def self.down
    remove_column :listings, :views
  end
end
