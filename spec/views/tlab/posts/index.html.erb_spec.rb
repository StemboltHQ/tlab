require 'spec_helper'

describe "tlab/posts/index" do
  before(:each) do
    assign(:posts, [
      stub_model(Tlab::Post,
        :title => "Title",
        :preview => "Preview",
        :author => nil
      ),
      stub_model(Tlab::Post,
        :title => "Title",
        :preview => "Preview",
        :author => nil
      )
    ])
  end

  it "renders a list of posts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Preview".to_s, :count => 2
  end
end
