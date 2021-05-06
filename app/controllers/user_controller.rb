class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_events = @user.created_events
    @user_attendance = @user.attended_events
  end
end
