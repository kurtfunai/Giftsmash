class Ability
  include CanCan::Ability
  def initialize(user)
    if user
      #can :manage, :all # For Admin Roles
      can :read, List # Can view but not edit lists
      can :manage, List, :user_id => user.id
    else 
      can :read, :all      
    end
    
  end
end