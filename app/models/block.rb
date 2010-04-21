class Block < ActiveRecord::Base
  has_many :documents
  has_many :categories
end
