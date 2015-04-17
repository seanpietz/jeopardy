class EpisodesController < ApplicationController
  def show
    @episode = Episode.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @episode }
    end
  end
end
