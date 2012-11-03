module SessionsHelper
	  def sign_in(instructor)
    	
      cookies[:remember_token] = { value: instructor.remember_token, expires: 3.hours.from_now.utc }
                                
    	self.current_instructor = instructor
    end

    def signed_in?
    	!current_instructor.nil?
  	end

    def current_instructor=(instructor)
    	@current_instructor = instructor
  	end

  	def current_instructor
    	@current_instructor ||= Instructor.find_by_remember_token(cookies[:remember_token])
  	end

  	def sign_out
    	self.current_instructor = nil
    	cookies.delete(:remember_token)
  	end
end
