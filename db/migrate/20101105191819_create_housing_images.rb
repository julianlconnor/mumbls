class CreateHousingImages < ActiveRecord::Migration
  def self.up
    create_table :housing_images do |t|
      t.string :caption
      t.integer :housing_id

      t.timestamps
    end
  end

  def self.down
    drop_table :housing_images
  end
end
