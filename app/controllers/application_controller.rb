class ApplicationController < ActionController::Base
		protect_from_forgery
		include SessionsHelper

		before_filter :set_current_ip

		  protected
			def set_current_ip
				Instructor.IP = request.env['action_dispatch.remote_ip']
				
			end

end
