class Notes::SearchesController < ApplicationController
  def index
    @notes = Note.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end
end
