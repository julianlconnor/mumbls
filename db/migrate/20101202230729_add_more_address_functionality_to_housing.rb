class AddMoreAddressFunctionalityToHousing < ActiveRecord::Migration
  def self.up
    add_column :housings, :optional_address, :string
    add_column :housings, :city, :string
    add_column :housings, :zip_code, :string
    add_column :housings, :state, :string
  end

  def self.down
    remove_column :housings, :optional_address
    remove_column :housings, :city, :string
    remove_column :housings, :zip_code, :string
    remove_column :housings, :state, :string
  end
end
