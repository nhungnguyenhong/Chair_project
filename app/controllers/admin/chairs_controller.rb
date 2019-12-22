class Admin::ChairsController < ApplicationController
  before_filter :verify_is_admin
  before_action :find_chair, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  layout 'admin'
  def index
    @chairs = Chair.all.order(id: :desc).page(params[:page]).per(10)
    @brands = Brand.all
    if params[:brand] && params[:brand] != "0"
      @brand_id = params[:brand].to_i
      @brand = @brands.find(@brand_id)
      @chairs = @brand.chairs
    else
      @chairs = Chair.all
    end
    @search = @chairs.order(id: :desc).ransack params[:q]
    @chairs = @search.result.page(params[:page]).per 9
  end
  
  def new
    @chair = Chair.new
    @brands = Brand.all
  end
  
  def create
    @chair = Chair.new chair_params
    @chair.brand_id = params[:brand_id]
    @chair.category_id = Brand.find(params[:brand_id]).category.id
    if @chair.save
      flash[:success] = "Successfully!!!"
      redirect_to admin_chairs_path
    else
      flash[:danger] = "Can not create new chair"
      redirect_to :back
    end  
  end
  
  def edit
    @brands = Brand.all
  end
  
  def update
    # @user = find_user
    @chair.brand_id = params[:brand_id]
    @chair.category_id = Brand.find(params[:brand_id]).category.id
    if @chair.update_attributes chair_params
      flash[:success] = "Info chair updated"
      redirect_to admin_chairs_path
    else
      flash[:danger] = "Can not update chair"
      redirect_to :back
    end
  end
  def destroy
    @chair.destroy
  
  end 
  private
  
  def verify_is_admin
    (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
  end
  
  def chair_params
    params.require(:chair).permit(:name, :function, :quantity, :description, :price, :img)
  end
  
  def find_chair
    @chair = Chair.find_by id: params[:id]
    return @chair if @chair
    flash[:warning] = t("no_chair_warning")
    redirect_to admin_chairs_path
  end
end
