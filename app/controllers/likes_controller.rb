class LikesController < ApplicationController

   def create
      @like = Like.new( post_id: params[:post_id], user_id: params[:user_id] )

      @like.save

      redirect_to posts_path
   end

end
