class Admin::UsersController < ApplicationController
  before_filter :verify_is_admin
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  layout 'admin'
  def index
    @search = User.order(id: :desc).ransack params[:q]
    @users = @search.result.page(params[:page]).per 9
  end
  
  def show
    flash[:success] = ""
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "Successfully!!!"
      render :new
    else
      flash[:danger] = "Not successful"
      redirect_to :back
    end
  end
    
  def edit
  end
  
  def update
    # @user = find_user
    if @user.update_attributes user_params
      flash[:success] = "Profile update"
      redirect_to :back
    else
      render :edit
    end
  end
  
  def destroy
    @user.destroy
  end
  
  private

  def verify_is_admin
    (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
  end
  
  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation, :birthday, :gender
  end
  
  def find_user
    @user = User.find_by id: params[:id]

    return @user if @user
    flash[:warning] = t("no_user_warning")
    redirect_to root_path
  end
end
