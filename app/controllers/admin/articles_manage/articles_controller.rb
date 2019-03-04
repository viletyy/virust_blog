class Admin::ArticlesManage::ArticlesController < Admin::BaseController
  before_action :find_one, only: [:edit, :update, :destroy]
  before_action :find_categories,only: [:new,:create,:edit,:update]

  def index
    if params[:keyword].present?
      @articles = Article.includes(:tags,:user).search(params[:keyword]).order_with_desc("created_at").page(params[:page]).per(LIST_PAGE)
    else
      @articles = Article.includes(:tags,:user).order_with_desc("created_at").page(params[:page]).per(LIST_PAGE)
    end
    @begin_count = (@articles.current_page - 1)*LIST_PAGE + 1
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params.except(:tags))
    @article.tags = bind_tags
    @article.user = @current_user
    if @article.save
      redirect_to admin_articles_manage_articles_path
      flash[:success] = "新增文章成功"
    else
      flash[:error] = @article.errors.full_messages.join(",")
      render :new
    end
  end

  def edit

  end

  def update
    @article.attributes = article_params.except(:tags)
    @article.tags = bind_tags
    if @article.save
      redirect_to admin_articles_manage_articles_path
      flash[:success] = "更新文章成功"
    else
      flash[:error] = @article.errors.full_messages.join(",")
      render :edit
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

  private
  def find_one
    @article = Article.find_by_id(params[:id])
  end

  def find_categories
    @categories = Categories::MarkArticle.limit(50)
  end

  def bind_tags
    if !article_params[:tags].blank?
      tag_ids = []
      article_params[:tags].split(", ").each do |tn|
        tag = Tags::MarkArticle.find_or_create_by(name:tn)
        tag_ids << tag
      end
      tags = Tags::MarkArticle.where(id:tag_ids)
    else
      tags = Tags::MarkArticle.where(id:"")
    end
    tags
  end

  def article_params
    params.require(:article).permit!
  end
end
