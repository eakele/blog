class UsersController < ApplicationController
  def verify
    user = User.find_by_email(params[:email])
      if user.nil?
      redirect_to '/login'
      flash[:error] = "Incorrect email"
      return
    else
      if user.authenticate(params[:password]) #.authenticate is a function from bcrypt; enabled by defining has_secure_password in User model
        session[:user_id] = user.id
        redirect_to '/'
        return
      else
        redirect_to :back
        flash[:error] = "Incorrect password"
      end
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to '/login'
  end
end
