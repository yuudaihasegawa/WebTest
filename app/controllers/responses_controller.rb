class ResponsesController < ApplicationController

  before_action :login_user, only: [:create]
  def login_user
    unless user_signed_in? 
      redirect_to new_user_registration_path
    end
  end

  def create
    @post = Post.find(params[:post_id])
    @response = current_user.responses.new(response_params)
    @response.post_id = @post.id
    if @response.save
      flash[:success] = '投稿が完了しました'
      redirect_to post_path(@post)
    else
      render template: "posts/show"
    end
  end

  private

  def response_params
    params.require(:response).permit(:user_id,:post_id,:message)
  end
end
