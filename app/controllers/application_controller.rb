class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  before_filter :set_current_ip

  protected
  	def set_current_ip
    	Instructor.IP = request.env['REMOTE_HOST']
    	request.env.each do |k,v|
    		puts(k)
    		puts(v)
    		puts('\n\n\n')
    	end
	end

end
