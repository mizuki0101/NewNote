class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit]
  before_action :move_to_index, except: [:index, :show]

  def index
    @notes = Note.includes(:user).order("created_at DESC").page(params[:page]).per(10)
  end

  def new
    @note = Note.new
  end

  def create
    Note.create(note_params)
    redirect_to root_path
  end

  def show
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
    params.require(:note).permit(:title, :content).merge(user_id: current_user.id)
  end

  def set_note
    @note = Note.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
