require_dependency "tlab/application_controller"

module Tlab
  class PostsController < ApplicationController
    load_and_authorize_resource

    layout 'application'

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
        params.require(:post).permit(:title, :preview, :published_at, :author_id, :body)
      end
  end
end
