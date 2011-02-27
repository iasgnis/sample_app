class SessionsController < ApplicationController
# include SessionsHelper
  def new
    @title = "Sign in"
  end

  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?                           
      flash.now[:error] = "Invalid email/password combination."
      @title = "Sign in"
      render 'new'
    else
      sign_in user
      redirect_to user
    end
  end
  
  def detroy
    
  end

 # Begin: This code should be in sessions_helper, but it wasn't running, so I'll put it here
 # End of sessions_helper code
end
