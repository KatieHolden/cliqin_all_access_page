class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  before_filter :set_current_ip

  protected
  	def set_current_ip
    	Instructor.IP = request.env['HTTP_X_REAL_IP']
    	
	end

end
