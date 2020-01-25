class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit]
  before_action :move_to_index, except: [:index, :show]

  def index
    @notes = Note.includes(user: :comments).order("created_at DESC").page(params[:page]).per(10)
  end

  def new
    @note = Note.new
    @tag = Tag.new
    @tags = Tag.all
  end

  def create
    Note.create(note_params)
    redirect_to root_path
  end

  def show
    # @user = User.find(1)
    # NoteMailer.send_when_update(@user).deliver
    @tags = Tag.all
    @comment = Comment.new
    @comments = @note.comments.includes(:user)
  end

  def edit  
  end

  def update
    note = Note.find(params[:id])
    note.update(note_params)
    redirect_to root_path(note.id)
  end

  def destroy
    note = Note.find(params[:id])
    note.destroy
    redirect_to root_path
  end

  

  private

  def note_params
    params.require(:note).permit(:title, :content, tag_ids: []).merge(user_id: current_user.id)
  end

  def set_note
    @note = Note.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
