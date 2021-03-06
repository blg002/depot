class StoreController < ApplicationController

  skip_before_filter :authorize
  
  def index
    if params[:set_locale]
      redirect_to store_path(locale: params[:set_locale])
    else
      @products = Product.order(:title)

      @session_count = increment_session_count
      @session_count_message = "You have visited this page #{@session_count} times since your last purchase" if @session_count > 5

      @cart = current_cart
    end
  end

  private

  def increment_session_count
    session[:counter] ||= 0
    session[:counter] += 1
  end

end
