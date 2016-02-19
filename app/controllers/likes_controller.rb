class LikesController < ApplicationController

   def create
      @like = Like.new( post_id: params[:post_id], user_id: params[:user_id] )

      @like.save

      post = @like.post

      respond_to do |format|
         format.html { redirect_to posts_path }
         format.json { render json: { post_id: post.id, likes: post.likes.count } }
      end

   end

end
