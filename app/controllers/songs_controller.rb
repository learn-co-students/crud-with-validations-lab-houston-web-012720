class SongsController < ApplicationController

  before_action :current_song, only: [:show, :destroy, :edit, :update]

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(strong_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @song.update(strong_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def index
    @songs  = Song.all
  end

  def show
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  private

  def current_song
    @song = Song.find(params[:id])
  end

  def strong_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end

end
