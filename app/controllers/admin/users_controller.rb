class Admin::UsersController < Admin::BaseController
  before_action :set_user, except: %i[index]

  def index
    @users = User.all
  end

  def show; end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to admin_users_path, notice: 'Пользователь обновлен.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: 'Пользователь удален'
  end

  private

  def user_params
    params.require(:user).permit(:name, :last_name, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
