class SongsController < ApplicationController

    def new
        @song = Song.new
    end

    def create
        @song = Song.create(song_params(:name, :artist_id, :genre_id))
        redirect_to song_path(@song)
    end
    
    def show
        find_song
    end

    def edit
        find_song
    end

    def update
        find_song
        @song = Song.update(song_params(:name, :artist_id, :genre_id))
        redirect_to song_path(@song)
    end

    def index
        @songs = Song.all
    end
end

private

    def song_params(*args)
        params.require(:song).permit(*args)
    end

    def find_song
        @song = Song.find(params[:id])
    end
