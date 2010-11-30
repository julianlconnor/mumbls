class AddIsStudentToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :is_student, :boolean, :default => 0
  end

  def self.down
    remove_column :users, :is_student
  end
end
