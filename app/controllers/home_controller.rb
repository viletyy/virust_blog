class HomeController < ApplicationController
  layout "application"

  def index
    @articles = Article.includes(:tags,:user).is_show_home
    if params[:category_id].present?
      @articles = @articles.where(category_id:params[:category_id])
    end

    if params[:tag_id].present?
      @articles = @articles.joins(:tags).where("tags.id = ?","#{params[:tag_id]}").distinct
    end

    @categories = Categories::MarkArticle.includes(:articles).is_show_home.limit(5)
    @new_articles = Article.is_show_home.order_with_desc("created_at").limit(5)
    @tags = Tags::MarkArticle.includes(:articles).is_show_home.limit(5)
    @articles = @articles.order_with_desc("articles.updated_at").page(params[:page]).per(LIST_PAGE)
    @begin_count = (@articles.current_page - 1)*LIST_PAGE + 1
  end

  def article_detail
    @article = Article.find_by_id(params[:id])
    @articles = Article.where_with_time("updated_at",@article.updated_at).limit(5)
    @new_articles = Article.is_show_home.order_with_desc("created_at").limit(5)
  end
end
