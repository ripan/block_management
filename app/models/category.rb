class Category < ActiveRecord::Base
  belongs_to :block
  has_one :document
end
