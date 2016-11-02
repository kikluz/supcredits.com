class PagesController < ApplicationController

  skip_before_filter :authorize

  def show
    if params[:page].blank?
      render template: "pages/home"
    else
      render template: "pages/#{params[:page]}"
    end
  end
end
