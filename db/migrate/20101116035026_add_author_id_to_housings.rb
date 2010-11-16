class AddAuthorIdToHousings < ActiveRecord::Migration
  def self.up
    add_column :housings, :author_id, :integer
  end

  def self.down
    remove_column :housings, :author_id
  end
end
