class Admin::InvoicesController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_invoice, only: :show
  load_and_authorize_resource

  def index
    @invoices = Invoice.order_by_time.page(params[:page]).per Settings.per_page
  end

  def show
  end

  def update
    unless @invoice.init?
      @user_invoice = @invoice.user_invoices.send(@invoice.status).first
      if @invoice.update_attributes status_params
        @user_invoice.update_attributes status_params
        flash[:success] = t "invoices.messages.update_success"
      else
        flash[:danger] = t "invoices.messages.update_fail"
      end
    else
      flash[:danger] = t "invoices.messages.cant_update"
    end
    redirect_to admin_invoice_url @invoice
  end

  private
  def correct_invoice
    @invoice = Invoice.find_by id: params[:id]
    if @invoice.nil?
      flash[:danger] = t "invoices.messages.not_found"
      redirect_to admin_invoices_url
    end
  end

  def status_params
    params.require(:invoice).permit :status
  end
end
