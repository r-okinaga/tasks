class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by!(id: params[:id])
    @tasks = @user.tasks
  end

  def new
    @user = User.new

  end

  def create
    User.transaction do
      @user = User.new(user_params)
      @user.save!

      redirect_to user_path(@user)
    end
  rescue ActiveRecord::RecordInvalid
    render :new
  end
  def edit
    @user= User.find_by!(id: params[:id])
    @tasks = Task.all
  end
  def update
    @user = User.find_by!(id: params[:id])
    @user.attributes = user_params
    @user.save

    redirect_to :user

  end

  def destroy
    @user = User.find_by!(id: params[:id])
    @user.destroy

    redirect_to :users

  end
  def user_params
    params.require(:user).permit(:user_name, :age, :password)
  end

end