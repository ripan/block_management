class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name
      t.boolean :has_expiry_date
      t.timestamps
    end
  end

  def self.down
    drop_table :categories
  end
end
