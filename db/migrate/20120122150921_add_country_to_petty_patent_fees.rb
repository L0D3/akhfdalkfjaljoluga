class AddCountryToPettyPatentFees < ActiveRecord::Migration
  def self.up
    add_column :petty_patent_fees, :country, :string
  end

  def self.down
    remove_column :petty_patent_fees, :country
  end
end
