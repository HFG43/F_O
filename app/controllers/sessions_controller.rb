class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: sessions_params[:email])
    puts "Test #{user.name}"
    if user&.authenticate(sessions_params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome, #{user.email}"
      redirect_to root_path
    else
      flash[:error] = "Invalid email or password"
      redirect_to root_path 
    end  
  end

  def destroy
    reset_session
    redirect_to root_path
  end  

  private

  def sessions_params
    params.permit(:email, :password)
  end  
end
