class PostsController < ApplicationController


  def index
    @user = current_user
    @posts = Post.all
    @user = User.all

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
      redirect_to :posts # ＠postsとすることでDBから取得したデータを指定すると、そのコントローラーのshowアクションに該当するページに遷移する。「redirect_to パラメータ」
  else
    render "posts/new"

  end
  end

  def show

    @user = current_user
    @users = User.all

    @post = Post.find(params[:id])

    @comment = Comment.new
    @comments = @post.comments#投稿詳細に関連付けてあるコメントを全取得


  end
private
 def post_params
    params.require(:post).permit(:post_name,:user_id,:introduction,:image)
 end

end
