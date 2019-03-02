class PostsController < ApplicationController
  before_action :get_posts

  def index
  end

  def create
    post = current_user.posts.build(post_params)
    if post.save
      redirect_to posts_url
    else
      render 'index'
    end
  end

  private

    def get_posts
      @posts = Post.all
      @post  = Post.new
    end

    def post_params
      params.require(:post).permit(:body)
    end
end
