class AddAliasToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :alias, :string
  end

  def self.down
    remove_column :users, :alias
  end
end
