class Shop::InvoicesController < ApplicationController
  def new
    @invoice = Invoice.new
  end
end
