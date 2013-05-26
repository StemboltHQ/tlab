require 'spec_helper'

describe "tlab/posts/show" do
  before(:each) do
    @post = assign(:post, stub_model(Tlab::Post,
      :title => "Title",
      :preview => "Preview",
      :author => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Preview/)
    rendered.should match(//)
  end
end
