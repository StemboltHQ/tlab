require 'spec_helper'

Tlab::ApplicationController.class_eval do
  def current_user
  end
end

module Tlab
  describe PostsController do
    before(:each) do
      @ability = Object.new
      @ability.extend(CanCan::Ability)
      @ability.can :manage, :all
      @controller.stub(:current_ability).and_return(@ability)
    end

    describe '#rescue_friendly_history' do
      context 'found a match' do
        let(:post) { stub_model Post }
        before(:each) do
          Post.stub_chain(:friendly, :find).and_return post
          get :show, id: 'noslughere', use_route: :tlab
        end
        it 'looks up post from history' do
          should redirect_to post
        end
      end
      context 'no match found' do
        it 'raises an exception' do
          expect {
            get :show, id: 'betterexplode', use_route: :tlab
          }.to raise_exception(ActiveRecord::RecordNotFound)
        end
      end
    end

    describe "GET index" do
      before(:each) do
        get :index, use_route: :tlab
      end
      it { should render_template :index }
      specify { assigns(:posts).should_not be_nil }
    end

    describe "GET show" do
      let(:post) { stub_model Post }
      before(:each) do
        Post.should_receive(:find_by_slug!).and_return post
        get :show, id: post.to_param, use_route: :tlab
      end
      it { should render_template :show }
      specify { assigns(:post).should == post }
      specify { assigns(:post).should be_decorated }
    end

    describe "GET new" do
      before(:each) do
        get :new, {use_route: :tlab}
      end
      it { should render_template :new }
      specify { assigns(:post).should be_a_new(Post) }
    end

    describe "GET edit" do
      let(:post) { stub_model Post }
      before(:each) do
        Post.should_receive(:find_by_slug!).and_return post
        get :edit, {:id => post.to_param, use_route: :tlab}
      end
      specify { assigns(:post).should eq(post) }
      it { should render_template :edit }
    end

    describe "POST create" do
      let(:attributes) { { body: 'sups' } }

      context 'save succeeds' do
        before(:each) do
          Post.any_instance.should_receive(:save).and_return(true)
          post :create, { post: attributes, use_route: :tlab }
        end
        it { should redirect_to assigns(:post) }
      end

      context 'save fails' do
        before(:each) do
          Post.any_instance.should_receive(:save).and_return(false)
          post :create, { post: attributes, use_route: :tlab }
        end
        it { should render_template :new }
        specify { assigns(:post).should be_a_new(Post) }
      end
    end

    describe "PUT update" do
      let(:post) { stub_model(Post) }
      let(:post_params) { { 'preview' => 'sups' } }
      before(:each) do
        Post.should_receive(:find_by_slug!).and_return post
      end
      context 'update succeeds' do
        before(:each) do
          post.should_receive(:update).with(post_params).and_return(true)
          put :update, { id: post.to_param, post: post_params, use_route: :tlab }
        end
        it { should redirect_to post }
        specify { assigns(:post).should == post }
      end
      context 'update fails' do
        before(:each) do
          post.should_receive(:update).with(post_params).and_return(false)
          put :update, { id: post.to_param, post: post_params, use_route: :tlab }
        end
        it { should render_template :edit }
        specify { assigns(:post).should == post }
      end
    end

    describe "DELETE destroy" do
      let(:post) { stub_model(Post) }
      before(:each) do
        Post.should_receive(:find_by_slug!).and_return post
        post.should_receive(:destroy)
        delete :destroy, {:id => post.to_param, use_route: :tlab}
      end
      it { should redirect_to posts_path }
    end

  end
end
