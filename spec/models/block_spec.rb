require 'spec_helper'

#describe Block do
#  before(:each) do
#    @valid_attributes = {
#      
#    }
#  end
#
#  it "should create a new instance given valid attributes" do
#    Block.create!(@valid_attributes)
#  end
#end


describe Block do
  
  before(:each) do
        @block = Block.new
  end
  
  it "should be invalid without a blockname" do

    @block.should_not be_valid
    @block.name = "ripan"
    @block.should be_valid
  end
  
end