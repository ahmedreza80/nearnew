class UsersController < ApplicationController
  before_action :logged_in_as_admin?

  def new_agent
    @user = User.new(role_id: 2)
  end

  def create_agent
    @user = User.new(role_id: 2)
    @user.attributes = agent_params
    if @user.save
      redirect_to url_for(controller: :welcome, action: :home)
    else
      render 'new_agent'
    end
  end

  private
  def logged_in_as_admin?
    current_user&.admin?
  end

  def agent_params
    params.require(:user).permit(:username, :email, :location, :pincode, :phone, :password, :password_confirmation)
  end
end
