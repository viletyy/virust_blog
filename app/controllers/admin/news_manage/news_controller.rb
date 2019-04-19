class Admin::NewsManage::NewsController < Admin::BaseController
  before_action :find_one, only: [:edit, :update, :destroy]
  before_action :find_categories,only: [:new,:create,:edit,:update]

  def index
    if params[:keyword].present?
      @all_news = News.includes(:tags,:source).search(params[:keyword]).order_with_desc("created_at").page(params[:page]).per(LIST_PAGE)
    else
      @all_news = News.includes(:tags,:source).order_with_desc("created_at").page(params[:page]).per(LIST_PAGE)
    end
    @begin_count = (@all_news.current_page - 1)*LIST_PAGE + 1
  end

  def new
    @article = News.new
  end

  def create
    @news = News.new(news_params.except(:tags))
    @news.tags = bind_tags
    if @news.save
      redirect_to admin_news_manage_news_index_path
      flash[:success] = "新增文章成功"
    else
      flash[:error] = @news.errors.full_messages.join(",")
      render :new
    end
  end

  def edit

  end

  def update
    @news.attributes = news_params.except(:tags)
    @news.tags = bind_tags
    if @news.save
      redirect_to admin_news_manage_news_index_path
      flash[:success] = "更新文章成功"
    else
      flash[:error] = @news.errors.full_messages.join(",")
      render :edit
    end
  end

  def destroy
    if @news.update(status:-1)
      redirect_to admin_news_manage_news_index_path
      flash[:success] = "删除文章成功"
    else
      flash[:error] = @news.errors.full_messages.join(",")
    end
  end

  private
  def find_one
    @news = News.find_by_id(params[:id])
  end

  def find_categories
    @categories = Categories::MarkNews.limit(50)
  end

  def bind_tags
    if !news_params[:tags].blank?
      tag_ids = []
      news_params[:tags].split(",").each do |tn|
        tag = Tags::MarkNews.find_or_create_by(name:tn)
        tag_ids << tag
      end
      tags = Tags::MarkNews.where(id:tag_ids)
    else
      tags = Tags::MarkNews.where(id:"")
    end
    tags
  end

  def news_params
    params.require(:news).permit!
  end
end
