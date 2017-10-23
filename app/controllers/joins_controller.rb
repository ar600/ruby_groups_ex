class JoinsController < ApplicationController
  def new
  end
  def create
    @group = Group.find(params[:group_id])
    if @group.user == current_user

      # do nothing
    else
      Join.create(user:current_user, group: Group.find(params[:group_id]))
      redirect_to "/groups/#{@group.id}"
    end
  end

  def destroy
      @join = Join.find(params[:join_id])
      @join.destroy if current_user === @join.user
      redirect_to "/groups/"
    end

end
