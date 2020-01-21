class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @notes = @user.notes.page(params[:page]).per(10).order("created_at DESC")
  end
  
end
