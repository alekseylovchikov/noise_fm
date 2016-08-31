class NoisesController < ApplicationController
  before_action :authenticate_song!, except: [:show]
  before_filter :require_permission
  before_action :find_song
  before_action :find_noise, only: [:show, :destroy, :edit, :update]

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

  def edit
  end

  def update
    if @noise.update(noise_params)
      redirect_to song_noise_path(@song, @noise), notice: 'Your song successfully updated.'
    else
      render :edit
    end
  end

  def show
    @noises = Noise.where(song_id: @song).order("created_at DESC").reject { |e| e.id == @noise.id }
  end

  def destroy
    @noise.destroy
    redirect_to root_path
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

  def require_permission
    @song = Song.find(params[:song_id])
    if current_song != @song
      redirect_to root_path, notice: 'Sorry, you\'re not allowed to view that page.'
    end
  end
end
