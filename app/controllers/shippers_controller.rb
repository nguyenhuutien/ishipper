class ShippersController < ApplicationController
  load_and_authorize_resource
  skip_load_and_authorize_resource only: :index
  before_action :load_support, only: :show

  def show
    render @shipper
  end

  private
  def load_support
    @support = Supports::User.new current_user: current_user, params: params
  end
end
