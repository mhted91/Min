class HomeController < ApplicationController
 def index  
 end

  def write
    post = Post.new
    post.title_db = params[:title]
    post.content_db = params[:content]
    post.save
 	
    redirect_to "/home/list"
  end

  def list
     @print = Post.all
  end

  def destroy
    @post = Post.find(params[:my_id])
    @post.destroy
 
    redirect_to "/home/list"
  end

  def update_view
    @post = Post.find(params[:my_id])
  end

  def update_real
    @post = Post.find(params[:my_id])
    @post.title_db = params[:title]
    @post.content_db = params[:content]
    @post.save
  
    redirect_to "/home/list"
  end
  
  def reply_destroy
    @post = Post.find(params[:my_id])
    @post.reply_destroy
 
    redirect_to "/home/list"
  end
 
  def reply_write
    reply = Reply.new
    reply.reply_content = params[:reply_content]
    reply.post_id = params[:post_number]
    reply.save
    redirect_to "/home/list"  
  end
  
  def reply_update_view
    @post = Post.find(params[:my_id])
  end
  
  def reply_update_real
    @post = Post.find(params[:my_id])
    @post.reply_content = params[:reply_content]
    @post.save
    
    redirect_to "/home/list"
  end

end