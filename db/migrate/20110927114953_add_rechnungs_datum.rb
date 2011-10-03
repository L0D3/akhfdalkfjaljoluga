class AddRechnungsDatum < ActiveRecord::Migration
  def self.up
    add_column :bills, :rechnungsdatum, :date
  end

  def self.down
    remove_column :bills, :rechnungsdatum
  end
end
