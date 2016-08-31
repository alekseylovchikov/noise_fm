class SongsController < ApplicationController
  before_action :find_song, only: [:show, :dashboard]
  before_action :find_noise, only: [:show, :dashboard]

  def index
    @songs = Song.all.order("created_at DESC")
  end

  def show
  end

  def dashboard
  end

  private
  def find_song
    if params[:id].nil?
      @song = current_song
    else
      @song = Song.find(params[:id])
    end
  end

  def find_noise
    @noises = Noise.where(song_id: @song).order("created_at DESC")
  end
end
