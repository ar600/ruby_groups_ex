class JoinsController < ApplicationController
  def new
  end
  def create
    Join.create(user:current_user, group: Group.find(params[:group_id]))
    redirect_to "/groups"
  end

  def destroy
      @join = Join.find(params[:join_id])
      @join.destroy if current_user === @join.user
      redirect_to "/groups"
    end

end
