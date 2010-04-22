require 'spec_helper'

describe "/blocks/edit.html.erb" do
  include BlocksHelper

  before(:each) do
    assigns[:block] = @block = stub_model(Block,
      :new_record? => false
    )
  end

  it "renders the edit block form" do
    render

    response.should have_tag("form[action=#{block_path(@block)}][method=post]") do
    end
  end
end
