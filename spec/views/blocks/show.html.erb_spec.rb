require 'spec_helper'

describe "/blocks/show.html.erb" do
  include BlocksHelper
  before(:each) do
    assigns[:block] = @block = stub_model(Block)
  end

  it "renders attributes in <p>" do
    render
  end
end
