class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.string :username

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
