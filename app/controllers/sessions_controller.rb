class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # If the user exists AND the password entered is correct
    if user && user == User.authenticate_with_credentials(params[:email], params[:password])
      # Save the user id inside the browser cookie
      session[:user_id] = user.id
      redirect_to '/'
    else
      puts "YOU GOT REDIRECTED!!!!!!!!!!!"
      # If user's login doesn't work, send them back to the login form
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end



end
