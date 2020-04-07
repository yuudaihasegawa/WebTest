class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @post_category = PostCategory.where(category_id: @category.id)
    @posts = []
    @post_category.each do |post_category|
      @posts << Post.where(id: post_category.post_id)
    end
    @posts.flatten!
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end