class Admin::NewsManage::LikeRecordsController < Admin::BaseController
  before_action :find_one, only: [:edit, :update, :destroy]

  def index
    if params[:keyword].present?
      @like_records = LikeRecords::MarkNews.where("title like ?", "%#{params[:keyword]}%").order("created_at desc").page(params[:page]).per(LIST_PAGE)
    else
      @like_records =  LikeRecords::MarkNews.order("created_at desc").page(params[:page]).per(LIST_PAGE)
    end
    @begin_count = (@like_records.current_page - 1)*LIST_PAGE + 1
  end

  def new

  end

  def create
    @like_record = LikeRecords::MarkNews.new(like_record_params)
    if @like_record.save
      redirect_to admin_news_manage_like_records_path
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
      redirect_to admin_news_manage_like_records_path
      flash[:success] = "更新点赞记录成功"
    else
      render :edit
      flash[:error] = @like_record.errors.full_messages.join(",")
    end
  end

  def destroy
    if @like_record.update(status:-1)
      redirect_to admin_news_manage_like_records_path
      flash[:success] = "删除点赞记录成功"
    else
      flash[:error] = @like_record.errors.full_messages.join(",")
    end
  end

  private
    def find_one
      @like_record = LikeRecords::MarkNews.find_by_id(params[:id])
    end

    def like_record_params
      params.require(:like_record_mark_news).permit!
    end
end
