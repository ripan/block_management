class Block < ActiveRecord::Base
  has_many :documents
  has_many :categories
  validates_presence_of :name
  validates_presence_of :postcode
  validates_presence_of :build_date
end
