class CreateRatings < ActiveRecord::Migration
  
  def self.up
    create_table :ratings do |t|
    	t.integer :user_id
      t.integer :rate_id
      t.integer :rateable_id
      t.string  :rateable_type, :limit => 32
      t.timestamps
    end
    
    add_index :ratings, :rate_id
    add_index :ratings, :user_id
    add_index :ratings, [:rateable_id, :rateable_type]
  end
  
  def self.down
    drop_table :ratings
  end
  
end