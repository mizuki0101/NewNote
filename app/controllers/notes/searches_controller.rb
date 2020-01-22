class Notes::SearchesController < ApplicationController
  def index
    @notes = Note.search(params[:keyword])
  end
end
