class AddPatentTypeToPatents < ActiveRecord::Migration
  def self.up
    add_column :patents, :patent_type, :string
  end

  def self.down
    remove_column :patents, :patent_type
  end
end
