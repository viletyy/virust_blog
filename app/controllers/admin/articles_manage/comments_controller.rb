class Admin::ArticlesManage::CommentsController < Admin::BaseController
  before_action :find_one, only: [:edit, :update, :destroy]

  def index
    if params[:keyword].present?
      @comments = Comments::MarkArticle.where("title like ?", "%#{params[:keyword]}%").order("created_at desc").page(params[:page]).per(LIST_PAGE)
    else
      @comments = Comments::MarkArticle.order("created_at desc").page(params[:page]).per(LIST_PAGE)
    end
    @begin_count = (@comments.current_page - 1)*LIST_PAGE + 1
  end

  def new

  end

  def create
    @comment = Comments::MarkArticle.new(comment_params)
    if @comment.save
      redirect_to admin_articles_manage_comments_path
      flash[:success] = "新增评论成功"
    else
      render :new
      flash[:error] = @comment.errors.full_messages.join(",")
    end
  end

  def edit

  end

  def update
    @comment.attributes = comment_params
    if @comment.save
      redirect_to admin_articles_manage_comments_path
      flash[:success] = "更新评论成功"
    else
      render :edit
      flash[:error] = @comment.errors.full_messages.join(",")
    end
  end

  def destroy
    if @comment.update(status:-1)
      redirect_to admin_articles_manage_comments_path
      flash[:success] = "删除评论成功"
    else
      flash[:error] = @comment.errors.full_messages.join(",")
    end
  end

  private

  def find_one
    @comment = Comments::MarkArticle.find_by_id(params[:id])
  end

  def comment_params
    params.require(:comment_mark_article).permit!
  end
end
