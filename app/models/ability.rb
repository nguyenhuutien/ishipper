class Ability
  include CanCan::Ability

  def initialize user, controller_namespace
    user ||= User.new
    alias_action :new, :create, :edit, :update, :destroy, to: :crud
    case controller_namespace
    when "Shop"
      if user.shop?
        can :manage, Invoice, user_id: user.id
      end
    else
      can :manage, User, id: user.id
      can :read, User
    end
  end
end
