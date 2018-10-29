class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    user ||= User.new
      if User.current_role == 'Global Admin' 
        can :manage, Users
        can :manage, Visitors
        can :manage, Invites
        can :manage, Locations
      elsif User.current_role == 'Location Admin'
        can :manage, Users
        can :manage, Visitors
        can :manage, Invites
          # can :read, Users
          # can :update, Users
          # cannot :destroy, Users
          # cannot :create, Users
      elsif User.current_role == 'Front Desk Admin'
        can :read, Users
        can :read, Visitors
        can :update, Visitors
        can :manage, Invites
      elsif User.current_role == 'Security Admin'
        can :read, Visitors
      elsif User.current_role == 'Employee'
        can :read, Visitors
        can :create, Invites
      else
        can :read, :all
      end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
