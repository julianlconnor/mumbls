class AddAuthorIdToListings < ActiveRecord::Migration
  def self.up
    add_column :listings, :author_id, :integer
  end

  def self.down
    remove_column :listings, :author_id
  end
end
