class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, :to => :crud
    alias_action :create, :read, :to => :read_create
    
    user ||= User.new # guest user (not logged in)

    if true or user.super_admin?
    # if user.super_admin?
      can :manage, :all
    elsif user.patient?
      can :manage, Post,   user_id: user.id
      can :read, Post
      can :manage, Comment,   user_id: user.id
      can :manage, User,       id: user.id
    elsif user.doctor?
      can :read_create, Post,   user_id: user.id
      can :manage, User,       id: user.id

    else
      can :read, Post
    end
  end
end
