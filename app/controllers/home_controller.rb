class HomeController < ApplicationController
  layout "application"

  def index
    @articles = Article.includes(:tags,:user).is_show_home.order_with_desc("created_at").page(params[:page]).per(LIST_PAGE)
    @begin_count = (@articles.current_page - 1)*LIST_PAGE + 1
  end

  def article_detail
    @article = Article.find_by_id(params[:id])
  end
end
