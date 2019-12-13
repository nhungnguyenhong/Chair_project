class ChairsController < ApplicationController
    skip_before_filter :verify_authenticity_token  
    def index
        @categories = Category.all
        if params[:category]
            @category = @categories.find(params[:category])
            @chairs = @category.chairs
        elsif params[:brand]
            @brand = Brand.find params[:brand]
            @chairs = @brand.chairs
        else
            @chairs = Chair.all
        end
        sort_by = params[:sort_by]
        case sort_by
        when "price_asc"
            @search = @chairs.order(price: :asc).ransack params[:q]
            @price_asc = true
        when "price_desc"
            @search = @chairs.order(price: :desc).ransack params[:q]
            @price_desc = true
        else
            @search = @chairs.order(id: :desc).ransack params[:q]
        end
        if !params[:limit]
            @chairs = @search.result.page(params[:page]).per 9
        else
            @chairs = @search.result.page(params[:page]).per params[:limit]
        end
        @quantity_chair = @search.result.count
        @order_item = current_order.order_items.new
    end

    def show
        @chair =  Chair.find params[:id]
        @list_other_chair = Chair.where("id!=?",params[:id]).limit(4).order(id: :desc)
        @url_current = request.original_url
        @order_item = current_order.order_items.new
        if current_user
            if RecommendHistory.where("chair_id = ?", params[:id]).count != 0
                @chair_history = RecommendHistory.where("chair_id = ?", params[:id]).first
                @chair_history.update updated_at: Time.now.utc
            else
                @chair_history = RecommendHistory.new(user_id: current_user.id, chair_id: params[:id])
                @chair_history.save
            end
            @histories = current_user.recommend_histories.where("chair_id != ?", params[:id]).limit(4).order(updated_at: :desc)
        end 
    end
    
    def rating
        @chair_id = params[:chair_id]
        @point = params[:point]
        @rating = Rating.new(user_id: current_user.id, chair_id: @chair_id, point: @point).save
        @point_summary = Chair.find(@chair_id).ratings.sum(:point)
        @count_rating = Chair.find(@chair_id).ratings.count
        @point_avg = @point_summary/@count_rating
        @chair = Chair.find(params[:chair_id])
        @chair.update rating: @point_avg
        render json:@point_avg
    end
    
    def get_rating
        if current_user
            @rating = Rating.where("chair_id = ? and user_id = ?",params[:chair_id], current_user.id).first
            render json:@rating
        end
    end
end
