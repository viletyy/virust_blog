class Admin::ArticlesManage::CategoriesController < Admin::BaseController
  before_action :find_one, only: [:edit, :update, :destroy]

  def index
    if params[:keyword].present?
      @categories = Categories::Article.where("title like ?", "%#{params[:keyword]}%").order("created_at desc").page(params[:page]).per(LIST_PAGE)
    else
      @categories = Categories::Article.order("created_at desc").page(params[:page]).per(LIST_PAGE)
    end
    @begin_count = (@categories.current_page - 1)*LIST_PAGE + 1
  end

  def new
    @category = Categories::Article.new
  end

  def create
    @category = Categories::Article.new(category_params)
    if @category.save
      redirect_to admin_articles_manage_categories_path
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
      redirect_to admin_articles_manage_categories_path
      flash[:success] = "更新分类成功"
    else
      render :edit
      flash[:error] = @article.errors.full_messages.join(",")
    end
  end

  def destroy
    if @category.update(status:-1)
      redirect_to admin_articles_manage_categories_path
      flash[:success] = "删除分类成功"
    else
      flash[:error] = @category.errors.full_messages.join(",")
    end
  end

  private

  def find_one
    @category = Categories::Article.find_by_id(params[:id])
  end

  def category_params
    params.require(:categories_article).permit!
  end
end
