class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @feed_back = FeedBack.new
  end

  def show
    @feed_back = FeedBack.new
    render template: "pages/#{params[:page]}"
  end
end
