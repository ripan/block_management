class CreateBlocks < ActiveRecord::Migration
  def self.up
    create_table :blocks do |t|
      t.string :name,:postcode
      t.date  :build_date
      t.timestamps
    end
  end

  def self.down
    drop_table :blocks
  end
end
