class SessionsController < ApplicationController
  
  def new
  	render 'new'
  end

  def create
  	user = User.find_by_login(params[:session][:login].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      #if user.heir.is_a?(Instructor)
        #Instructor.update(user.heir.id, :IP => request.env['action_dispatch.remote_ip'])
      #end
      redirect_to user
    else
      flash.now[:error] = 'Invalid email/password combination' 
      render 'new'
    end
  end

  def destroy
  	sign_out
    redirect_to root_url
  end

end
