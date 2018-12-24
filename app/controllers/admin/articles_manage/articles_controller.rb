class Admin::ArticlesManage::ArticlesController < ApplicationController
  before_action :find_one, only: [:edit, :update, :destroy]

  def index
    if params[:keyword].present?
      @articles = Article.where("title like ?", "%#{params[:keyword]}%").order("created_at desc").page(params[:page]).per(LIST_PAGE)
    else
      @articles = Article.order("created_at desc").page(params[:page]).per(LIST_PAGE)
    end
    @begin_count = (@articles.current_page - 1)*LIST_PAGE + 1
  end

  def new

  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to admin_articles_manage_articles_path
      flash[:success] = "新增文章成功"
    else
      render :new
      flash[:error] = @article.errors.full_messages.join(",")
    end
  end

  def edit

  end

  def update
    @article.attributes = article_params
    if @article.save
      redirect_to admin_articles_manage_articles_path
      flash[:success] = "更新文章成功"
    else
      render :edit
      flash[:error] = @article.errors.full_messages.join(",")
    end
  end

  def destroy
    if @article.update(status:-1)
      redirect_to admin_articles_manage_articles_path
      flash[:success] = "删除文章成功"
    else
      flash[:error] = @article.errors.full_messages.join(",")
    end
  end

  def find_one
    @article = Article.find_by_id(params[:id])
  end

  def article_params
    params.require(:article).permit!
  end
end
