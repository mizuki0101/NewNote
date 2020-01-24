class Notes::SearchesController < ApplicationController
  def index
    @notes = Note.search(params[:keyword])
    @tags = Tag.all
  end
end
