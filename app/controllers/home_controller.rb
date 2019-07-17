class HomeController < ApplicationController
  layout "application"

  before_action :find_real_ip, only: [:article_detail, :like_article]
  before_action :find_article, only: [:article_detail, :like_article, :article_comments, :article_comment]
  before_action :find_like_record, only: [:article_detail]

  def index
    @articles = Article.includes(:tags,:user).is_show_home
    if params[:category_id].present?
      @articles = @articles.where(category_id:params[:category_id])
    end

    if params[:tag_id].present?
      @articles = @articles.joins(:tags).where(tags: {id: params[:tag_id]}).distinct
    end

    if params[:keyword].present?
      @articles = @articles.where("articles.title like ? articles.desp like ?", "#{params[:keyword]}", "#{params[:keyword]}")
    end

    @categories = Categories::MarkArticle.includes(:articles).is_show_home.limit(5)
    @new_articles = Article.is_show_home.order_with_desc("created_at").limit(5)
    @tags = Tags::MarkArticle.includes(:articles).is_show_home.limit(5)
    @articles = @articles.order_with_desc("articles.updated_at").page(params[:page]).per(LIST_PAGE)
    @begin_count = (@articles.current_page - 1)*LIST_PAGE + 1
  end

  def article_detail
    @article.view_records.create(user: @current_user, ip_address: @real_ip)
    @articles = Article.where_with_time("updated_at",@article.updated_at).limit(5)
    @new_articles = Article.is_show_home.order_with_desc("created_at").limit(5)
  end

  def like_article
    @article.like_records.create(user: @current_user, ip_address: @real_ip)
    redirect_to article_detail_home_path(@article)
  end

  def article_comments
    @comments = @article.comments.page(params[:page]).per(LIST_PAGE)
    @begin_count = (@comments.current_page - 1)*LIST_PAGE + 1
  end

  def article_comment
    @comment = @article.comments.new(comment_params)
    if @comment.save
      redirect_to article_detail_home_path(@article)
      flash[:success] = "评论成功"
    else
      redirect_to article_detail_home_path(@article)
      flash[:error] = "评论失败"
    end
  end

  def news

  end

  def news_comments

  end

  def news_comment

  end

  private
    def find_real_ip
      @real_ip = real_ip(request)
    end

    def find_article
      @article = Article.find_by_id(params[:id])
    end

    def find_like_record
      if @current_user.present?
        @like_record = @article.like_records.where(user_id:@current_user.id).first
      else
        @like_record = @article.like_records.where(ip_address: @real_ip).first
      end
    end

    def comment_params
      params.require(:comment).permit!
    end
end
