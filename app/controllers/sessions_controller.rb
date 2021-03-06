class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      # Redirect
      redirect_to root_path
    else
      # Create an error message.
      flash[:danger] = 'Invalid email/password combination' # Not quite right!  
      render 'new'
    end
  end

  def destroy
  end

end
