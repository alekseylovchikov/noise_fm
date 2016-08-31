class SongsController < ApplicationController
  def index
    @songs = Song.all.order("created_at DESC")
  end

  def show
    @song = Song.find(params[:id])
    @noises = Noise.where(song_id: @song).order("created_at DESC")
  end
end
