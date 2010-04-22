require 'spec_helper'

describe Category do
  before(:each) do
    @valid_attributes = {
      :name => "cat1"
    }
  end

  it "should be invalid without name" do
    category = Category.new
    category.should_not be_valid
    category.attributes = @valid_attributes
    category.should be_valid
  end
end
