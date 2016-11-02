class SessionsController < ApplicationController

  skip_before_filter :authorize, except: [:destroy]

  def new
  end

  def create

    # test for password
    if params[:password]=='magic'

      # set session and let them in
      session[:auth_code] = true
      redirect_to root_url(notice: 'Successfully Logged In.')

    else

      # fail
      redirect_to new_session_url(notice: 'Login Failed')
    end
  end

  def destroy
    session[:auth_code] = nil
    redirect_to root_path
  end
end
