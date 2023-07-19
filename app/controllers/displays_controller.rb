class DisplaysController < ApplicationController
  def index
    @user = current_user
    @displays = Display.all
    @posts = Post.all
   end


  def create
    @user = current_user
    #@post = Post.find(params[:display][:post_id])
    #@display= @post.display
    @display = Display.new(params.require(:display).permit(:comment, :post_id ))

    if @display.save!

      puts "Displayの保存に成功しました"
      flash[:notice] = "コメント登録いたしました。"
      redirect_to :displays
    else
      puts "Displayの保存に失敗しました"
      flash[notice] = "失敗しました"
      @displays = Display.all
      render "displays/index"
  end
  end
end


