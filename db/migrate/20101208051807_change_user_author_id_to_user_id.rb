class ChangeUserAuthorIdToUserId < ActiveRecord::Migration
  def self.up
    rename_column :listings, :author_id, :user_id
  end

  def self.down
    rename_column :listings, :user_id, :author_id
  end
end
