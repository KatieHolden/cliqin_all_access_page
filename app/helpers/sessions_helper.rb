module SessionsHelper
	  def sign_in(user)
      cookies[:remember_token] = { value: user.remember_token, expires: 3.hours.from_now.utc }                         
    	self.current_user = user
    end

    def signed_in?
    	!current_user.nil?
  	end

    def current_user=(user)
    	@current_user = user
  	end

  	def current_user
    	@current_user ||= User.find_by_remember_token(cookies[:remember_token])
  	end

  	def sign_out
      if self.current_user.heir.is_a?(Instructor)
        self.current_user.heir.update_attributes(:IP => nil)

        courses = Course.where(:instructor_ID => self.current_user.heir.id)

        courses.each do |c|
          c.update_attributes(:active => nil)
        end
      end
    	self.current_user = nil
    	cookies.delete(:remember_token)
  	end
end
