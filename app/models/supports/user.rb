class Supports::User
  def initialize args
    args.each do |key, value|
      instance_variable_set "@#{key}", value
    end
  end

  ["favorite_list_users", "black_list_users"].each do |user_type|
    define_method user_type do
      instance_variable_set("@#{user_type}", @current_user.send(user_type)) unless
        instance_variable_get "@#{user_type}"
    end
  end

  def reviews
    @current_user.passive_reviews.includes :owner
  end

  Settings.rate.list_rate.each do |rate|
    define_method rate do
      instance_variable_set "@#{rate}", reviews.where(rating_point:
        Settings.rate.send(rate), review_type: "rate").size unless
        instance_variable_get "@#{rate}"
    end
  end

  def sum_rate
    sum = 0
    Settings.rate.list_rate.each do |rate|
      sum += send(rate)
    end
    sum
  end

  def user_invoice_id
    @params[:user_invoice_id] if @params
  end

  def invoice
    Invoice.find_by id: @params[:invoice_id] if @params
  end

  def create_invoice
    @current_user.invoices.new
  end
end
