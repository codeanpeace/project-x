class SorceryCore < ActiveRecord::Migration
  def self.up
    add_column :users, :username, :null => false
    add_column :users, :email, :default => nil
    add_column :users, :crypted_password, :default => nil
    add_column :users, :salt, :default => nil
  end

  def self.down
    remove_column :users, :username, :null => false
    remove_column :users, :email, :default => nil
    remove_column :users, :crypted_password, :default => nil
    remove_column :users, :salt, :default => nil
  end
end