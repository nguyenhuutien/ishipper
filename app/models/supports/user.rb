class Supports::User
  attr_reader :current_user

  def initialize current_user
    @current_user = current_user
  end

  ["favorite_list_users", "black_list_users"].each do |user_type|
    define_method user_type do
      instance_variable_set("@#{user_type}", @current_user.send(user_type)) unless
        instance_variable_get "@#{user_type}"
    end
  end

  Settings.rate.list_rate.each do |rate|
    define_method rate do
      instance_variable_set "@#{rate}", @current_user.passive_reviews.where(rating_point:
        Settings.rate.send(rate), review_type: "rate").size
    end
  end

  def sum_rate
    sum = 0
    Settings.rate.list_rate.each do |rate|
      sum += send(rate)
    end
    sum
  end
end
