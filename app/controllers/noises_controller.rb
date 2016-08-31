class NoisesController < ApplicationController
  before_action :find_song
  before_action :find_noise, only: [:show]

  def new
    @noise = @song.noises.new
  end

  def create
    @noise = @song.noises.new noise_params

    if @noise.save
      redirect_to song_noise_path(@song, @noise)
    else
      render :new
    end
  end

  def show
    @noises = Noise.where(song_id: @song).order("created_at DESC").reject { |e| e.id == @noise.id }
  end

  private

  def noise_params
    params.require(:noise).permit(:title, :description)
  end

  def find_song
    @song = Song.find(params[:song_id])
  end

  def find_noise
    @noise = Noise.find(params[:id])
  end
end
