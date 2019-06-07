class PagesController < ApplicationController
  def home
    @post = Post.new
    @posts = Post.all.last(200)
  end
end
