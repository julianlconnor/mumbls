class AddPublicEmailToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :email_is_public, :boolean, :default => true
  end

  def self.down
    remove_column :users, :email_is_public
  end
end
