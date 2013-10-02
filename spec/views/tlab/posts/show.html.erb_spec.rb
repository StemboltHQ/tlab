require 'spec_helper'

describe "tlab/posts/show" do
  before(:each) do
    @post = assign(:post, stub_model(Tlab::Post,
      :title => "Title",
      :body => 'Body',
      :published_at => DateTime.parse("2000-01-01"),
      :author => nil ).decorate
    )
    view.stub(:can?).and_return false
  end

  it "renders the title in a header" do
    render

    assert_select 'header h1', text: 'Title'
  end

  it "renders the body in an itemprop article" do
    render

    assert_select "[itemprop='articleBody']", text: 'Body'
  end

  it "renders the published date" do
    render

    assert_select '.published-at', text: (h l DateTime.parse('2000-01-01'), format: :tlab )
  end

  it "does not render an edit button" do
    render

    assert_select '.edit', count: 0
  end

  context "user can manage post" do
    before(:each) do
      view.stub(:can?).and_return true
    end

    it "renders an edit button" do
      render

      assert_select '.edit'
    end
  end
end
