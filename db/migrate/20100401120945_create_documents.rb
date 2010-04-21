class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.integer :size  # file size in bytes
      t.string  :content_type   # mime type, ex: application/mp3
      t.string  :filename    # sanitized filename
      t.integer :block_id, :category_id
      t.date :expiry_date
      t.timestamps
    end
  end

  def self.down
    drop_table :documents
  end
end
