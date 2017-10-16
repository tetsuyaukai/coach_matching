class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user
    normal_ability if @user.normal?
    admin_ability if @user.admin?
  end

  def normal_ability
    can :manage, Agreement, user_id: @user.id
    can :update, Agreement do |agreement|
      agreement.content.user.id == @user.id
    end
    can [:index, :show, :create], Content
    can [:coach_index, :coach_show], Content, user_id: @user.id
    can [:edit, :update], Content, user_id: @user.id
    can [:show], User

  end

  def admin_ability
    can :manage, :all
  end
end
