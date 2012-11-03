class SessionsController < ApplicationController
  
  def new
  	render 'new'
  end

  def create
  	instructor = Instructor.find_by_login(params[:session][:login].downcase)
    if instructor && instructor.authenticate(params[:session][:password])
      sign_in instructor
      redirect_to instructor
    else
      flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
  	sign_out
    redirect_to root_url
  end

end
