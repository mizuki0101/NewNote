class TagsController < ApplicationController

  def index
    @tag = Tag.new
    @tags = Tag.all
  end

  def create
  Tag.create(tag_params)
    redirect_to  new_note_path
  end

  def show
    @tags = Tag.all
    @tag = Tag.find(params[:id])
    @notes = @tag.notes.page(params[:page]).per(10).order("created_at DESC")
  end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end

end
