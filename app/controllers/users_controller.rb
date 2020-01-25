class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    # NoteMailer.send_when_update(current_user).deliver
    @user = User.find(params[:id])
    @notes = @user.notes.page(params[:page]).per(10).order("created_at DESC")
    @tags = Tag.all
  end
  
end
