class AddCanPostListingToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :can_post, :boolean, :default => 0
  end

  def self.down
    remove_column :users, :can_post
  end
end
