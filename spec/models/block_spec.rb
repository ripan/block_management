require 'spec_helper'

describe Block do
  
  before(:each) do
    @block = Block.new
    @valid_attributes = {
      :name => 'ripan',
      :postcode => '123',
      :build_date => '1984-01-08'
    }
  end
  
  it "should be invalid without a name" do
    @block.attributes = @valid_attributes.except(:name)
    @block.should_not be_valid
    @block.name = "ripan"
    @block.should be_valid
  end
  
  it "should be invalid without a postcode" do
    @block.attributes = @valid_attributes.except(:postcode)
    @block.should_not be_valid
    @block.postcode = "12345"
    @block.should be_valid
  end
  
  it "should be invalid without a build_date" do
    @block.attributes = @valid_attributes.except(:build_date)
    @block.should_not be_valid
    @block.build_date = "1984-01-08"
    @block.should be_valid
  end
  
end