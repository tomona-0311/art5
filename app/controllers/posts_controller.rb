class PostsController < ApplicationController


  def index
    @user = current_user
    @posts = Post.all
  end
  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @user = current_user
    @post = Post.new(post_params)
    if @post.save
      puts "Postの保存に成功しました"
          flash[:notion] = "作品登録完了"
      redirect_to :posts # ＠displayとすることでDBから取得したデータを指定すると、そのコントローラーのshowアクションに該当するページに遷移する。「redirect_to パラメータ」
  else
    render "posts/new"

  end
  end

  def show
    @user = current_user

    @post = Post.find(params[:id])
    #@displays = Display.find(params[:display_id])
    #@user = User.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
    #@displays = Display.where(post_id: @post.id)

  end
private
 def post_params
    params.require(:post).permit(:post_name,:user_id,:introduction,:image)
 end
end
