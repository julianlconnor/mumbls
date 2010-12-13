class AddViewsToHousings < ActiveRecord::Migration
  def self.up
    add_column :housings, :views, :integer, :default => 0
  end

  def self.down
    remove_column :housings, :views
  end
end
