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
end
