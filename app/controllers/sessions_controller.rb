class SessionsController < ApplicationController
  def create
    user = User.find_by_email( params[:user][:email] )

    if user && user.authenticate( params[:user][:password] )
      flash[:notice] = 'Signed in Successfully'
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:alert] = 'Invalid email or password'
      render 'new'
    end
  end

  def new
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Signed out Successfully'
  end
end
