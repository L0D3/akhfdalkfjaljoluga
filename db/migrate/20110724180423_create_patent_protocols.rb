class CreatePatentProtocols < ActiveRecord::Migration
  def self.up
    create_table :patent_protocols do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :patent_protocols
  end
end
