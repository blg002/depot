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

end
