class Ability
  include CanCan::Ability
  def initialize(user)
    if user
      can :manage, List, :user_id => user.id
      can :read, List # Can view but not edit lists for other users
      can :manage, Item, :list => { :user_id => user.id }
    else 
      can :read, List      
    end
  end
end