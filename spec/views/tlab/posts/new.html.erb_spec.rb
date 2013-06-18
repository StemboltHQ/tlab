require 'spec_helper'

describe "tlab/posts/new" do
  before(:each) do
    assign(:post, stub_model(Tlab::Post,
      :title => "MyString",
      :preview => "MyString",
      :author => nil,
    ).as_new_record)
  end

  it "renders new post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", posts_path, "post" do
      assert_select "input#post_title[name=?]", "post[title]"
      assert_select "input#post_preview[name=?]", "post[preview]"
      assert_select "input#post_slug[name=?]", "post[slug]", 0
    end
  end
end
