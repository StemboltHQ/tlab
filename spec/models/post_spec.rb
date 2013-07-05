require 'spec_helper'

describe Tlab::Post do
  let (:post) { Tlab::Post.new }

  describe '#next' do
    before :each do
      post.stub(:future_posts).and_return([1,2,3])
    end

    it { post.next.should eq(1) }
  end

  describe '#prev' do
    before :each do
      post.stub(:past_posts).and_return([3,2,1])
    end

    it { post.prev.should eq(3) }
  end
end
