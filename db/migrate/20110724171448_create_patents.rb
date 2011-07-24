class CreatePatents < ActiveRecord::Migration
  def self.up
    create_table :patents do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :patents
  end
end
