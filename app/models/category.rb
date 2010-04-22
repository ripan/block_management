class Category < ActiveRecord::Base
  belongs_to :block
  has_one :document
  validates_presence_of :name
end
