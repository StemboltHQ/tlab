require_dependency "tlab/application_controller"

module Tlab
  class PostsController < ApplicationController
    before_filter :filter_params, only: :create
    load_and_authorize_resource class: 'Tlab::Post', find_by: :slug

    layout 'application'

    rescue_from ActiveRecord::RecordNotFound, :with => :rescue_friendly_history

    # GET /posts
    def index
    end

    # GET /posts/1
    def show
    end

    # GET /posts/new
    def new
    end

    # GET /posts/1/edit
    def edit
    end

    # POST /posts
    def create
      if @post.save
        redirect_to @post, notice: 'Post was successfully created.'
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /posts/1
    def update
      if @post.update(post_params)
        redirect_to @post, notice: 'Post was successfully updated.'
      else
        render action: 'edit'
      end
    end

    # DELETE /posts/1
    def destroy
      @post.destroy
      redirect_to posts_url, notice: 'Post was successfully destroyed.'
    end

    private
      # Only allow a trusted parameter "white list" through.
      def post_params
        params.require(:post).permit(:title, :preview, :published_at, :author_id, :body, :slug)
      end

      def filter_params
        params[:tlab_post] = post_params
      end

      def rescue_friendly_history exception
        Post.friendly.find(params[:id]).tap do |post|
          return redirect_to post, status: 301
        end
      end
  end
end
