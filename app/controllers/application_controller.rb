class ApplicationController < ActionController::Base
  before_action :store_user_location!, if: :storable_location?
  protect_from_forgery with: :exception

  helper_method :current_order

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_dashboard_path
    else
      stored_location_for(resource) || super
    end
  end

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  private
    # Its important that the location is NOT stored if:
    # - The request method is not GET (non idempotent)
    # - The request is handled by a Devise controller such as Devise::SessionsController as that could cause an 
    #    infinite redirect loop.
    # - The request is an Ajax request as this can lead to very unexpected behaviour.
    def storable_location?
      request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
    end

    def store_user_location!
      # :user is the scope we are authenticating
      store_location_for(:user, request.fullpath)
    end
end
