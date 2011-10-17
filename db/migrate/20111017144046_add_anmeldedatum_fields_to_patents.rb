class AddAnmeldedatumFieldsToPatents < ActiveRecord::Migration
  def self.up
    add_column :patents, :anmeldedatum_day, :integer
    add_column :patents, :anmeldedatum_month, :integer
  end

  def self.down
    remove_column :patents, :anmeldedatum_month
    remove_column :patents, :anmeldedatum_day
  end
end
