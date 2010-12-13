class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.integer :from_user
      t.string :from_user_alias
      t.integer :to_user
      t.string :to_user_alias
      
      t.string :title
      t.text :body
      
      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
