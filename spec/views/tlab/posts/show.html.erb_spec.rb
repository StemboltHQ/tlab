require 'spec_helper'

describe "tlab/posts/show" do
  before(:each) do
    @post = assign(:post, stub_model(Tlab::Post,
      :title => "Title",
      :preview => "Preview",
      :body => 'Body',
      :author => nil
    ))
    view.stub(:can?).and_return true
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Body/)
    rendered.should match(//)
  end
end
