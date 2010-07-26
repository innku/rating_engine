class CreateRates < ActiveRecord::Migration
  
  def self.up
    create_table :rates do |t|
      t.column :score, :integer
    end
  end
  
  def self.down
    drop_table :rates
  end
  
end