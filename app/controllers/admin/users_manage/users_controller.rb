class Admin::UsersManage::UsersController < Admin::BaseController
  before_action :find_one, only: [:edit, :update, :destroy]

  def index
    if params[:keyword].present?
      @users = User.where("title like ?", "%#{params[:keyword]}%").order("created_at desc").page(params[:page]).per(LIST_PAGE)
    else
      @users = User.order("created_at desc").page(params[:page]).per(LIST_PAGE)
    end
    @begin_count = (@users.current_page - 1)*LIST_PAGE + 1
  end

  def new

  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_manage_users_path
      flash[:success] = "新增用户成功"
    else
      render :new
      flash[:error] = @user.errors.full_messages.join(",")
    end
  end

  def edit

  end

  def update
    @user.attributes = user_params
    if @user.save
      redirect_to admin_users_manage_users_path
      flash[:success] = "更新用户成功"
    else
      render :edit
      flash[:error] = @user.errors.full_messages.join(",")
    end
  end

  def destroy
    if @user.update(status:-1)
      redirect_to admin_users_manage_users_path
      flash[:success] = "删除用户成功"
    else
      flash[:error] = @user.errors.full_messages.join(",")
    end
  end

  def find_one
    @user = User.find_by_id(params[:id])
  end

  def user_params
    params.require(:user).permit!
  end
end
