class PostsController < ApplicationController

   def index
      @posts = Post.all
   end

   def create
      post_params = params.require( :post ).permit( :body )

      @post = Post.new( body: post_params[:body], user: current_user )

      if @post.save
         redirect_to posts_path
      else
         render posts_path
      end
   end

end
