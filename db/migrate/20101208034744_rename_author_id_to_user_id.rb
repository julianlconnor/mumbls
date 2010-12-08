class RenameAuthorIdToUserId < ActiveRecord::Migration
  def self.up
    rename_column :housings, :author_id, :user_id
  end

  def self.down
    rename_column :housings, :user_id, :author_id
  end
end
