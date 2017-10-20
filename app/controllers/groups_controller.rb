class GroupsController < ApplicationController
  def new
  end
  def index
    @groups = Group.all
  end

  def create
      group = Group.new (group_params)

      if group.save
        Join.create(user: current_user, group: group )
        # session[:user_id] = user.id
        redirect_to '/groups/'
      else
        flash[:errors] = group.errors.full_messages
        redirect_to '/groups'
      end
  end

  def show
    @groups = Group.all
    @group = Group.find(params[:group_id])
    # @leave = Join.where(user: current_user, group: @group).first.id
    # @member = Join.find(params[:join_id])

  end
  def destroy
    Group.find(params[:group_id]).destroy
    redirect_to '/groups'
  end



  private
  def group_params
    params.require(:group).permit(:name,:description).merge(user: current_user)
  end
end
