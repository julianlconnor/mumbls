class CreateHousings < ActiveRecord::Migration
  def self.up
    create_table :housings do |t|
      t.string :title
      t.text :description
      t.string :address
      t.integer :price

      t.timestamps
    end
  end

  def self.down
    drop_table :housings
  end
end
