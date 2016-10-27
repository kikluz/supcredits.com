class SessionsController < ApplicationController
  def new
  end

  def create
  end

  def destroy
    session[:customer_id] = nil
    redirect_to root_path
  end
end
