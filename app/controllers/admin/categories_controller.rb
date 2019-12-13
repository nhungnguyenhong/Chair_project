class Admin::CategoriesController < ApplicationController
  before_filter :verify_is_admin
  before_action :find_category, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  layout 'admin'
  def index
    @search = Category.order(id: :desc).ransack params[:q]
    @categories = @search.result.page(params[:page]).per 9
  end
  
  def new
    @categories = Chair.new
  end
  
  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = "Successfully!!!"
      redirect_to admin_categories_path
    else
      flash[:danger] = "Can not create new category"
      redirect_to :back
    end  
  end
  
  def edit
  end
  
  def update
    # @user = find_user
    if @category.update_attributes category_params
      flash[:success] = "Info category updated"
      redirect_to admin_categories_path
    else
      flash[:danger] = "Can not update new category"
      redirect_to :back
    end
  end
  
  def destroy
    Chair.where(category_id: params[:id]).destroy_all
    @category.destroy
  end 
  private
  
  def verify_is_admin
    (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
  end
  
  def category_params
    params.require(:category).permit(:name, :description)
  end
  
  def find_category
    @category = Category.find_by id: params[:id]
    return @category if @category
    flash[:warning] = "Can not find category"
    redirect_to admin_categories_path
  end
end
