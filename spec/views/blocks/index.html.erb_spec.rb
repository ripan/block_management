require 'spec_helper'

describe "/blocks/index.html.erb" do
  include BlocksHelper

  before(:each) do
    assigns[:blocks] = [
      stub_model(Block),
      stub_model(Block)
    ]
  end

  it "renders a list of blocks" do
    render
  end
end
