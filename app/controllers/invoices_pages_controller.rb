class InvoicesPagesController < ApplicationController
  before_action :authenticate_user!

  def show
    @supports = Supports::Invoice.new current_user
    render template: "invoices_pages/#{params[:status]}"
  end
end
