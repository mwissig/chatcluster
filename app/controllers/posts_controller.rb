class PostsController < ApplicationController
  before_action :get_posts

  def index
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      ActionCable.server.broadcast 'makepost_channel',
                                   body:  @post.body,
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
