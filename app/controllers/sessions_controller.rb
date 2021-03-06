class SessionsController < ApplicationController
  
  def new
  	render 'new'
  end

  def create
  	user = User.find_by_login(params[:session][:login].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    else
      flash.now[:error] = 'Invalid login/password combination' 
      render 'new'
    end
  end

  def destroy
    #update on course and reset instructor IP
  	sign_out
    redirect_to root_url
  end

end
