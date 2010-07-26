class CreateRatings < ActiveRecord::Migration
  
  def self.up
    create_table :ratings do |t|
    	t.column :user_id, :integer
      t.column :rate_id, :integer
      t.column :rateable_id, :integer
      t.column :rateable_type, :string, :limit => 32
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