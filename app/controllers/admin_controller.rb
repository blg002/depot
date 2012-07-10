class AdminController < ApplicationController

  # GET /admin
  def index
    @total_orders = Order.count
  end

end
