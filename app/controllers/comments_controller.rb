class CommentsController < ApplicationController
  def index
    @comments = Comment.all
    @posts = Post.all
    @users = User.all
    @user = current_user

   end



  def create
    @user = current_user
    @post = Post.find(params[:comment][:post_id])
    #@display= @post.display
    #@user = User.find(params[:id])

    @comment = Comment.new(params.require(:comment).permit(:comment, :user_id, :post_id ))


    if @comment.save!

      puts "Displayの保存に成功しました"
      flash[:notice] = "コメント登録いたしました。"
      redirect_to @post
    else
      puts "Displayの保存に失敗しました"
      flash[notice] = "失敗しました"
      @comments = Comment.all
      render "comments/index"
  end
  end
  def show
    @user = current_user
    @comment = Comment.find(params[:id])
  end

  def destroy
    binding.pry
    comment = Comment.find(params[:id])
  if comment.post_id == post.id
   comment.destroy


    redirect_to comments_path
  end
end
  end


