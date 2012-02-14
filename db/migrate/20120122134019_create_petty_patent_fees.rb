class CreatePettyPatentFees < ActiveRecord::Migration
  def self.up
    create_table :petty_patent_fees do |t|
      t.integer :year_4
      t.integer :year_7
      t.integer :year_9

      t.timestamps
    end
  end

  def self.down
    drop_table :petty_patent_fees
  end
end
