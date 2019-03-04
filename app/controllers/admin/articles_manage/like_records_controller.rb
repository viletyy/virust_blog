class Admin::ArticlesManage::LikeRecordsController < Admin::BaseController
  before_action :find_one, only: [:edit, :update, :destroy]

  def index
    if params[:keyword].present?
      @like_records = LikeRecords::MarkArticle.where("title like ?", "%#{params[:keyword]}%").order("created_at desc").page(params[:page]).per(LIST_PAGE)
    else
      @like_records =  LikeRecords::MarkArticle.order("created_at desc").page(params[:page]).per(LIST_PAGE)
    end
    @begin_count = (@like_records.current_page - 1)*LIST_PAGE + 1
  end

  def new

  end

  def create
    @like_record = LikeRecords::MarkArticle.new(like_record_params)
    if @like_record.save
      redirect_to admin_articles_manage_like_records_path
      flash[:success] = "新增点赞记录成功"
    else
      render :new
      flash[:error] = @like_record.errors.full_messages.join(",")
    end
  end

  def edit

  end

  def update
    @like_record.attributes = like_record_params
    if @like_record.save
      redirect_to admin_articles_manage_like_records_path
      flash[:success] = "更新点赞记录成功"
    else
      render :edit
      flash[:error] = @like_record.errors.full_messages.join(",")
    end
  end

  def destroy
    if @like_record.update(status:-1)
      redirect_to admin_articles_manage_like_records_path
      flash[:success] = "删除点赞记录成功"
    else
      flash[:error] = @like_record.errors.full_messages.join(",")
    end
  end

  private
  def find_one
    @like_record = LikeRecords::MarkArticle.find_by_id(params[:id])
  end

  def like_record_params
    params.require(:like_record_mark_article).permit!
  end
end
