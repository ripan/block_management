class Block < ActiveRecord::Base
  has_many :documents
  has_many :categories
  validates_presence_of :name

end
