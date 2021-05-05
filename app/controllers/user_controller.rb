class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
    @events = @user.events.paginate(page: params[:page])
    @upcoming_events = @user.upcoming_events
  end
end
