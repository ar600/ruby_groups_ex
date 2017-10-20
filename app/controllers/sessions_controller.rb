
class SessionsController < ApplicationController
  def new

  end
  # +++++++++++++++++++++++++++++++++++++++++++++
  def create
    user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
    if user
      session[:user_id] = user.id
      # redirect_to '/groups/'+(user.id).to_s
      redirect_to '/groups/'
    else
      flash[:errors] = ["invalid password or username"]
      redirect_to '/sessions/new'
    end

  end
# +++++++++++++++++++++++++++++++++++++++++++++
  def destroy
    # User.find(session[:user_id]).destroy
    # session[:user_id] = nil
    reset_session
    redirect_to '/sessions/new'

  end
end
