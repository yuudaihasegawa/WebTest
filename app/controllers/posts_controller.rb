class PostsController < ApplicationController
  
  def index
    unless params[:search].blank?
      post = Post.where("title LIKE ?","%#{params[:search]}%")
      text = Post.where("text LIKE ?","%#{params[:search]}%")
      response =  Post.joins(:responses).where("message LIKE ?","%#{params[:search]}%")
      q = text | post
      @posts = (response | q)
    else
      @posts = Post.all
    end
  end

  def show
    @post = Post.find(params[:id])
    @response = Response.new
    @user = User.find(current_user.id)
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
    @category = Category.new
    @post.categories.build
  end

  def create
    # 生成処理
    @category = Category.new
    @post = current_user.posts.build(post_params)
    @categories = params.dig(:post,:categories_attributes)
    unless @categories.blank?
      if @post.save
        @old_categories = []
        @new_categories = []
        @categories.each do |category|
          @category = Category.find_by(name: category[1][:name])
          if @category.nil?
            #新規のカテゴリー
            @new_category = Category.new
            @new_category.name = category[1][:name]
            @new_category.save
            #投稿に紐づける新規のカテゴリーを一つの変数に
            @new_categories << @new_category
          else
            #既存のカテゴリーがある場合
            #投稿に紐づける既存のカテゴリーを一つの変数に
            @old_categories << @category
          end
        end
        # 既存のカテゴリーと新規スレッドの関連づけ
        unless @old_categories.blank?
          @old_categories.each do |old_category|
            @post_category = PostCategory.new
            @post_category.post_id = @post.id
            @post_category.category_id = old_category.id
            @post_category.save
          end
        end
        # 新規のカテゴリーと新規スレッドの関連づけ
        unless @new_categories.blank?
          @new_categories.each do |new_category|
            @post_category = PostCategory.new
            @post_category.post_id = @post.id
            @post_category.category_id = new_category.id
            @post_category.save
          end
        end
        flash[:success] = '投稿が完了しました'
        redirect_to post_path(@post)
      else
        render :new
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title,:text,:user_id)
  end
end
