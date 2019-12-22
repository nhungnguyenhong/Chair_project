class Admin::BrandsController < ApplicationController
    before_filter :verify_is_admin
    before_action :find_brand, only: [:show, :edit, :update, :destroy]
    skip_before_action :verify_authenticity_token
    layout 'admin'
    def index
        @search = Brand.order(id: :desc).ransack params[:q]
        @brands = @search.result.page(params[:page]).per 9
    end

    def new
        @brand = Brand.new
        @categories = Category.all
    end
    
    def create
        @brand = Brand.new brand_params
        @brand.category_id = params[:category_id]
        if @brand.save
          flash[:success] = "Successfully!!!"
          redirect_to new_admin_brand_path
        else
          flash[:danger] = "Can not create new brand"
          redirect_to :back
        end  
    end

    def show
    end

    def edit
        @categories = Category.all
    end

    def update
        @brand.category_id = params[:category_id]
        if @brand.update_attributes brand_params
            flash[:success] = "Info brand updated"
            redirect_to new_admin_brand_path
        else
            flash[:danger] = "Can not update brand"
            redirect_to :back
        end
    end

    def destroy
        Chair.where(brand_id: params[:id]).destroy_all
        @brand.destroy
    end

    def verify_is_admin
        (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
    end
      
    def brand_params
        params.require(:brand).permit(:name, :description, :img)
    end
      
    def find_brand
        @brand = Brand.find_by id: params[:id]
        return @brand if @brand
        flash[:warning] = "Can not find brand"
        redirect_to admin_brands_path
    end
end
