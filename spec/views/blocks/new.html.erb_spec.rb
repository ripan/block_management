require 'spec_helper'

describe "/blocks/new.html.erb" do
  include BlocksHelper

  before(:each) do
    assigns[:block] = stub_model(Block,
      :new_record? => true
    )
  end

  it "renders new block form" do
    render

    response.should have_tag("form[action=?][method=post]", blocks_path) do
    end
  end
end
