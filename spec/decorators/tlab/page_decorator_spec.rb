require 'spec_helper'

describe Tlab::PostDecorator do
  let (:post) { stub_model(Tlab::Post, title: 'A test') }
  let (:decorator) { post.decorate }
  let (:request) { double("Request") }

  before (:each) { request.stub(:original_url).and_return('http://test.com') }

  describe '#share_facebook' do
    subject { decorator.share_facebook request }
    it { should eq "https://www.facebook.com/sharer/sharer.php?u=http://test.com" }
  end

  describe '#share_twitter' do
    subject { decorator.share_twitter request }
    it { should eq "http://twitter.com/share?url=http://test.com" }
  end

  describe "#share_linkedin" do
    subject { decorator.share_linkedin request }
    it { should eq "http://www.linkedin.com/shareArticle?mini=true&url=http://test.com&title=A test" }
  end

  describe "#share_pinterest" do
    subject { decorator.share_pinterest request }
    it { should eq "http://pinterest.com/pin/create/button/?url=http://test.com" }
  end

  describe '#trunc_preview' do
    before(:each) { decorator.preview = "12345" }
    specify { decorator.trunc_preview(2).should eq("12&hellip;") }
  end
end

