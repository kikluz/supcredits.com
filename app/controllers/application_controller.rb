class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :guid, :authorize

  #
  # redirects user to root if not logged in
  #

  def authorize
    unless is_authorized?
      redirect_to root_url
    end
  end

  #
  # tells view if someone is logged in
  #

  helper_method :is_authorized?
  def is_authorized?
    if session[:auth_code].blank?
      return false
    else
      return true
    end
  end

  def guid
    # only if it doesn't exist already?
    if session[:guid].blank?
      session[:guid] = SecureRandom.urlsafe_base64
    end
    return session[:guid]
  end

  def append_info_to_payload(payload)
    super
    payload[:host] = request.host
    payload[:guid] = guid
    payload[:env] = Rails.env.to_s
    payload[:level] = Rails.logger.level

  end
end
