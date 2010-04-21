class Document < ActiveRecord::Base
  has_attachment :max_size => 1.kilobyte
  has_attachment :size => 1.megabyte..2.megabytes
  has_attachment :content_type => 'application/pdf'
  has_attachment :content_type => ['application/pdf', 'application/msword', 'text/plain']
  has_attachment :storage => :file_system, :path_prefix => 'public/files'  
  has_attachment :path_prefix => 'public/images/product_pics'

  validates_as_attachment
  
  belongs_to :block  
  belongs_to :category

  def expired?
    if self.created_at > self.expiry_date
      return true
    else
      return false
    end
  end
  
  
end
