class LoginController < ApplicationController
  before_filter :authorize, :except => :login

  def login
    if request.post?
      session[:user_id] = nil
      user = User.authenticate(params[:name], params[:password])
      if user
        session[:user_id] = user.id
        redirect_to(:action => "index")
      else
        flash[:notice] = "Invalid user/password combination"
      end
    end
  end
  
  def logout
    session[:user_id] = nil
    redirect_to(:action => "login")
  end
  
  def index
    @user = User.find(session[:user_id])
  end
end
