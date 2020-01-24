class LikesController < ApplicationController
  before_action :set_variables

  def like
    like = current_user.likes.new(note_id: @note.id)
    like.save
  end

  def unlike
    like = current_user.likes.find_by(note_id: @note.id)
    like.destroy
  end

  private

  def set_variables
    @note = Note.find(params[:note_id])
    @id_name = "#like-link-#{@note.id}"
    @id_heart = "#heart-#{@note.id}"
  end
end
