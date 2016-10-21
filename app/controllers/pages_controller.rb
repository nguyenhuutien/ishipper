class PagesController < ApplicationController
  def show
    @feed_back = FeedBack.new
    render template: "pages/#{params[:page]}"
  end
end
