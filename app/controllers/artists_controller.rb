class ArtistsController < ApplicationController

    def show
        @artist = Artist.find_by(id: params[:id])
    end

    def new
        @artist = Artist.new
    end

    def create
        @artist = Artist.new
        @artist.name = params[:artist][:name]
        @artist.bio = params[:artist][:bio]
        @artist.save
        redirect_to artist_path(@artist)
    end

    def edit
        @artist = Artist.find_by(id: params[:id])
    end

    def update
        @artist = Artist.find_by(id: params[:id])
        @artist.update(params.require(:artist).permit(:name, :bio))
        redirect_to artist_path(@artist)
    end

end
