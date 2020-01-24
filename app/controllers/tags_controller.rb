class TagsController < ApplicationController

  def index
    @tag = Tag.new
  end

  def create
  Tag.create(tag_params)
    redirect_to  new_note_path
  end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end

end
