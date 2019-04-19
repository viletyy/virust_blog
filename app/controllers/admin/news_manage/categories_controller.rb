class Admin::NewsManage::CategoriesController < Admin::BaseController
  before_action :find_one, only: [:edit, :update, :destroy]

  def index
    if params[:keyword].present?
      @categories = Categories::MarkNews.where("title like ?", "%#{params[:keyword]}%").order("created_at desc").page(params[:page]).per(LIST_PAGE)
    else
      @categories = Categories::MarkNews.order("created_at desc").page(params[:page]).per(LIST_PAGE)
    end
    @begin_count = (@categories.current_page - 1)*LIST_PAGE + 1
  end

  def new
    @category = Categories::MarkNews.new
  end

  def create
    @category = Categories::MarkNews.new(category_params)
    if @category.save
      redirect_to admin_news_manage_categories_path
      flash[:success] = "新增分类成功"
    else
      render :new
      flash[:error] = @category.errors.full_messages.join(",")
    end
  end

  def edit

  end

  def update
    @category.attributes = category_params
    if @category.save
      redirect_to admin_news_manage_categories_path
      flash[:success] = "更新分类成功"
    else
      render :edit
      flash[:error] = @article.errors.full_messages.join(",")
    end
  end

  def destroy
    if @category.update(status:-1)
      redirect_to admin_news_manage_categories_path
      flash[:success] = "删除分类成功"
    else
      flash[:error] = @category.errors.full_messages.join(",")
    end
  end

  private

    def find_one
      @category = Categories::MarkNews.find_by_id(params[:id])
    end

    def category_params
      params.require(:categories_mark_news).permit!
    end
end
