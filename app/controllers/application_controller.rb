class ApplicationController < ActionController::Base
  
  protect_from_forgery

  helper_method :date_loaded
  before_filter :set_date

  def date_loaded 
    return Time.now.strftime('%I:%M %p')
  end

  def set_date
    @date_loaded = Time.now.strftime('%I:%M %p')
  end

  private

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

end
